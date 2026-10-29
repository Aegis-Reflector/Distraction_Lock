#Overview

Distraction_Lock is a local tool for Arch Linux that blocks distracting domains by redirecting them to an invalid address in /etc/hosts. Every blocked attempt is logged to a SQLite database, and a statistics command summarizes usage over time.
Components
File	Role
blocker.sh	Reads blocklist.txt, adds IPv4 (0.0.0.0) and IPv6 (::1) entries to /etc/hosts
deblocker.sh	Removes the # BLOCKER block from /etc/hosts
log_attempt.py	Receives a domain as argument, inserts a row into blocker.db
stats.py	Reads blocker.db, displays total attempts and top 5 domains
init_db.py	Creates the attempts table in blocker.db
blocker.service	systemd Type=oneshot service that runs blocker.sh
Execution Flow

    blocker.sh reads each domain from blocklist.txt.

    For each domain, it adds 0.0.0.0 domain and ::1 domain to /etc/hosts.

    It calls log_attempt.py "$domain" to record the attempt.

    log_attempt.py inserts a row into blocker.db with the domain and a timestamp.

    stats.py queries the database and displays the total count and top 5 domains.

#Key Design Decisions

Why /etc/hosts and not dnsmasq?
Simple, no additional service, sufficient for local use. The blocker does not need to intercept DNS traffic for the entire network.

Why SQLite and not PostgreSQL?
Zero configuration, single file, no server to manage. For a personal project with one user, SQLite is enough.

Why Type=oneshot for systemd?
The script executes and terminates. The service does not need to stay active in the background.

Why Bash + Python?
Bash for system integration (/etc/hosts modification, systemd). Python for database logic and statistics.
Invariants

    blocker.sh and deblocker.sh must use the same MARKER (# BLOCKER).

    blocklist.txt contains domains only (no URLs, no https://, no www. unless intentional).

    log_attempt.py must be called with exactly one argument (sys.argv[1]).

    The attempts table has three columns: id (INTEGER PRIMARY KEY), domain (TEXT), timestamp (TEXT).
