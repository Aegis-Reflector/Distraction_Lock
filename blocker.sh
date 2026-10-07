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

while read -r domain; do
    [[ -z "$domain" || "$domain" == \#* ]] && continue

    if grep -q "0.0.0.0 $domain" "$HOSTS"; then
        echo "Already blocked : $domain"
    else
        echo "0.0.0.0 $domain" >> "$HOSTS"
        echo "Blocked : $domain"
    fi
done < "$BLOCKLIST"

echo "FIN."
