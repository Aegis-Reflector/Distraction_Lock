#!/bin/bash

BLOCKLIST="blocklist.txt"
HOSTS="/etc/hosts"
MARKER="# BLOCKER"

if [ ! -f "$BLOCKLIST" ]; then
    echo "Erreur : $BLOCKLIST introuvable"
    exit 1
fi

if ! grep -q "$MARKER" "$HOSTS"; then
    echo "" >> "$HOSTS"
    echo "$MARKER" >> "$HOSTS"
fi

#Read each domain and add if not blocked
while read -r domain; do
	#Ignores empty lines and comments
    [[ -z "$domain" || "$domain" == \#* ]] && continue

    if grep -q "0.0.0.0 $domain" "$HOSTS" &&  grep -q "::1 $domain" "$HOSTS";then
        echo "Already blocked : $domain"
    else
        echo "0.0.0.0 $domain" >> "$HOSTS"
	echo "::1 $domain" >> "$HOSTS"
        echo "Blocked : $domain"
    fi
done < "$BLOCKLIST"

echo "FIN."
		
