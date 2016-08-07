#!/usr/bin/env bash

color_print() {
    printf '\033[0;31m%s\033[0m\n' "$1"
}

warn() {
    color_print "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

require() {
    color_print "Checking requirements for ivim..."
    color_print "Checking vim version..."
    vim --version | grep 7.[3-9] || die "Your vim's version is too low!\nPlease download higher version(7.3+) from http://www.vim.org/download.php"
    color_print "Checking if git exists..."
    which git || die "No git installed!\nPlease install git from http://git-scm.com/downloads/"
    color_print "Check if ctags exists..."
    which ctags || warn "No ctags installed!\nPlease install ctags form http://ctags.sourceforge.net/ after ivim intallation!"
}

install() {
	cp ./vimrc ~/.vimrc
	mkdir -p ~/.vim/autoload
	cp ./plug.vim  ~/.vim/autoload/
	mkdir -p ~/.vim/bundle/
	cp -rf ./vim-hybrid ~/.vim/bundle/
    vim +PlugUpdate +qal
}

require
install
