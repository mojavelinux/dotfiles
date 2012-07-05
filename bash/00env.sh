#!/bin/bash

# setup shell environment variables

export TMPDIR=/tmp/$USER
mkdir -p $TMPDIR
export VISUAL=`which vim`
export EDITOR=`which vim`
export PAGER='less -R'
#export CDPATH=~/projects

# make the xmllint indent with tabs (yes, that is a TAB)
#export XMLLINT_INDENT="	"
# actually, 3 spaces now :)
export XMLLINT_INDENT="   "

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignorespace:ignoredups
# ... rather just remove all duplicates
#export HISTCONTROL=erasedups
export HISTIGNORE="pwd:ls:history:reload"

shopt -s histappend
# append each command to the history file immediately (rather than waiting until the end of your shell session to update it: http://pavlovich.org/musings/?p=6 
PROMPT_COMMAND="history -a"
#PROMPT_COMMAND="history -a;history -n"
#if [ -z "$PROMPT_COMMAND" ]; then
#   PROMPT_COMMAND="history -a"
#else
#   PROMPT_COMMAND="$PROMPT_COMMAND;history -a"
#fi

# ignore RCS directories when doing completions
export FIGNORE=.git:.svn:CVS

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#export SUDO_PROMPT="[sudo] password for `whoami`: "
