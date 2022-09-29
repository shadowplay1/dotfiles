#!/usr/bin/bash

read -p "Enter a commit message: " commit_message
echo

added=$(git add . > /dev/null 2>&1)
committed=$(git commit -m $commit_message > /dev/null 2>&1)
pushed=$(git push > /dev/null 2>&1)

if ! ${added} || ! ${committed} || ! ${pushed}; then
	echo
	echo "An error has occured."

	exit 1
fi

echo
echo "Committed successfully."

exit 0
