#!/usr/bin/bash

MAIN_BRANCH_NAME="main"

fetched=$(git fetch --p origin > /dev/null 2>&1)
resetted=$(git reset --hard origin/main > /dev/null 2>&1)
cleaned=$(git clean -f -d > /dev/null 2>&1)

if ! ${fetched} || ! ${resetted} || ! ${cleaned}; then
	echo
	echo "An error has occured."

	exit 1
fi

echo
echo "Local and remote repositories were synced successfully."

exit 0
