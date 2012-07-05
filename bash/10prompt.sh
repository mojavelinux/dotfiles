#!/bin/bash

# If not running interactively, don't do anything (don't run on Xsession start)
[ -z "$PS1" ] && return

DISTRO=`cat /etc/issue | head -1`
DISTRO='other'

case "$DISTRO" in
    Red*)
        USER_HOST_INFO="\[\033[0;31m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]"
        ;;
    Ubuntu*)
        USER_HOST_INFO="\[\033[0;30m\]\u\[\033[0m\]@\[\033[0;30m\]\h\[\033[0m\]"
        #USER_HOST_INFO="\[\033[0;33m\]\u\[\033[0m\]@\[\033[0;33m\]\h\[\033[0m\]"
        ;;
    *)
        USER_HOST_INFO="\u@\h"
        ;;
esac


PS1="[$USER_HOST_INFO:jdk\$(java_major_version) \W]\$ "
#if [ "$TERM" = "xterm" ]; then
#	TERM_TITLE="\[\033]0;\W\007\]"
#	PS1=$TERM_TITLE$PS1
#	unset TERM_TITLE
#fi

export PS1
unset USER_HOST_INFO
