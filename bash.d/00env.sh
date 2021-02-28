#!/bin/bash

# Increase process limit
ulimit -u 4096

# setup shell environment variables

export TMPDIR=/tmp/$USER
mkdir -p $TMPDIR
export VISUAL=`which vim`
export EDITOR=`which vim`
export PAGER='less -R'
#export CDPATH=~/projects

# make the xmllint indent with 2 spaces
export XMLLINT_INDENT="  "

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignorespace:ignoredups
# ... rather just remove all duplicates
#export HISTCONTROL=erasedups
export HISTIGNORE="pwd:ls:history:reload"

# append each command to the history file immediately (rather than waiting until the end of your shell session to update it: http://pavlovich.org/musings/?p=6 
shopt -s histappend
# NOTE PROMPT_COMMAND is used by Gnome Terminal to set the tab/window title
. /etc/profile.d/vte.sh

# ignore RCS directories when doing completions
#export FIGNORE=.git:.svn:CVS
export FIGNORE=.svn:CVS

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#export SUDO_PROMPT="[sudo] password for `whoami`: "

export XML_CATALOG_FILES='/etc/xml/catalog /usr/share/sgml/w3c-markup-validator/catalog.xml'
