#!/usr/bin/bash

set -e

e='\033'
RESET="${e}[0m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

is_installed() {
	command -v $1 > /dev/null 2>&1
}

is_husky_installed() {
	node ./scripts/check_husky.js > /dev/null 2>&1
}


# Colored log commands

info() {
	echo -e "${CYAN}[dotfiles] ${*}${RESET}"
}

error() {
	echo -e "${RED}[dotfiles - X] ${*}${RESET}"
}

warn() {
	echo -e "${YELLOW}[dotfiles - !] ${*}${RESET}"
}

success() {
	echo -e "${GREEN}[dotfiles] ${*}${RESET}"
}


# Installation scripts.

install_nodejs() {
	sleep 1
	info "[1/5] - Checking for Node.js installaion..."

	if ! is_installed node; then
		warn "Node.js is missing!"
		
		read -p "[dotfiles - ?] Proceed for Node.js installation? [y/n] " -n 1 answer
		echo

		if [ ${answer} != 'y' ]; then
			error "Node.js installation is aborted."
			return
		else 
			echo

			apt install nodejs -y
			success "Node.js was installed successfully!"
			
			echo
		fi
	else
		success "Node.js is already installed!"
	fi
}

install_git() {
	sleep 1
	info "[2/5] - Checking for Git installaion..."

	if ! is_installed git; then
		warn "Git is missing!"

		read -p "[dotfiles - ? Proceed for Git installation? [y/n] " -n 1 answer
		echo

		if [ ${answer} != 'y' ]; then
			error "Git installation is aborted."
			return
		else
			echo

			apt install git -y 
			success "Git was installed successfully!"

			echo
        fi

	else
		success "Git is already installed!"
	fi
}

install_typescript() {
	sleep 1
	info "[3/5] Checking for TypeScript installation..."

	if ! is_installed tsc || ! is_installed ts-node; then
		warn "TypeScript and/or its compiler is missing!"

		read -p "[dotfiles - ?] Proceed for TypeScript installation? [y/n] " -n 1 answer
		echo

		if [ ${answer} != 'y' ]; then
			error "TypeScript installation is aborted."
			return
		else
			echo

			npm i typescript ts-node -g -f
			success "TypeScript was installed successfully!"

			echo
		fi
	else
		success "TypeScript is already installed!"
	fi
}

install_husky() {
	sleep 1
	info "[4/5] Checking for Husky installation..."

	if ! is_husky_installed; then
		warn "Husky is missing!"

		read -p "[dotfiles - ?] Proceed for Husky installation? [y/n] " -n 1 answer
		echo

		if [ ${answer} != 'y' ]; then
			error "Husky installation is aborted."
			return
		else
			echo

			npm i husky -g
			success "Husky was installed successfully!"

			echo
		fi
	else
		success "Husky is already installed!"
	fi
}

install_dotfiles() {
	info "[5/5] Installing dotfiles in $HOME..."

	copy_status = cp ./files/{.babelrc.json,.eslintrc.json,.vimrc,prettier.config.js,.eslintignore,.gitignore,.gitconfig,.gitattributes,jsconfig.json,tsconfig.json} $HOME

	if ! copy_status; then
		error "Failed to install dotfiles."
		exit 1
	else
		success "Dotfiles were installed successfully!"
		finish
	fi
}


start() {
	info "---------------------------------------------------------"
	info "| dotfiles - by @shadowplay1                            |"
	info "---------------------------------------------------------"
	info "| This script will install node.js, git, TypeScript     |"
	info "| husky and all the dotfiles from this repository.      |"
	info "---------------------------------------------------------"

	echo

	if [ `uname` != 'Linux' ]; then
		error "Sorry, but `uname` is not supported to run this script at the moment."
		exit 1
	fi

	read -p "[dotfiles - ?] Proceed with dotfiles installation? [y/n] " -n 1 answer
	
	echo
	echo
	
	if [ ${answer} != 'y' ]; then
		 error "Aborted the dotfiles installation."
		exit 1
	else
		install_nodejs
		install_git

		install_typescript
		install_husky

		install_dotfiles
	fi
}

finish() {
	success "All set! Everything is ready to work now!"
	echo

	sleep 1.5
	exit 0
}


main() {
	start
}

main
