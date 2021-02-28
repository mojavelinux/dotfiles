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

# TODO move to .bash.d/01alias.sh
expelpath() {
    if echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
        export PATH=`echo $PATH | sed  "s;\(^\|:\)$1\($\|:\);\1;"`
    fi
}

unset i

#[[ -s $HOME/.travis/travis.sh ]] && source $HOME/.travis/travis.sh
#[[ -s $HOME/.sdkman/bin/sdkman-init.sh ]] && source $HOME/.sdkman/bin/sdkman-init.sh
#[[ -s $HOME/.jenv/bin/jenv ]] && eval "$($HOME/.jenv/bin/jenv init -)"
#[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm && rvm use system > /dev/null
#[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh
