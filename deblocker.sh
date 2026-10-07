#!/bin/bash

HOSTS="/etc/hosts"
MARKER="# BLOCKER"

if ! grep -q "$MARKER" "$HOSTS";then
	echo "No blocking"
	exit 0
fi

sed -i "/$MARKER/,\$d" "$HOSTS"

echo "Removed Blocker"
