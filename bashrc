# ~/.bashrc: executed by bash(1) for non-login shells.

# Skip if not running an interactive prompt and this isn't an Xsession start
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# enable programmable completion features
if [ -z "$BASH_COMPLETION" -a -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Execute all scripts in ~/.bash directory
for i in ~/.bash.d/[0-9][0-9]*.sh; do
    if [ -x "$i" ]; then
        . $i
    fi
done

unset i
