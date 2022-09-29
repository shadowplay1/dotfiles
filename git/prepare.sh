#!/usr/bin/bash

# constants

BASE_GITHUB_USERNAME="shadowplay1"
MAIN_BRANCH_NAME="main"


# event functions

on_finish() {
	echo
	echo 'Repository is now ready to be used.'
	
	exit 0
}

on_fail() {
	echo
	echo 'An error has occured.'

	exit 1
}


# inputs

read -p "Enter a repository name: " repo_name
read -p "Create an initial commit? [y/n] " -n 1 create_init_commit

echo "Preparing a Git repository..."

# command statuses

init_succeed=$(git init > /dev/null 2>&1)
branch_created=$(git checkout -b $MAIN_BRANCH_NAME > /dev/null 2>&1)

remote_added=$(git remote add origin https://github.com/$BASE_GITHUB_USERNAME/$repo_name.git > /dev/null 2>&1)


# status checks

if ! ${init_succeed} || ! ${branch_created} || ! ${remote_added}; then
	on_fail
fi


# preparing a repository

if [ ${create_init_commit} != 'y' ]; then
	on_finish
else
	echo

	git add .
	git commit -m "init" --no-verify	
	git push -u origin $MAIN_BRANCH_NAME

	on_finish
fi
