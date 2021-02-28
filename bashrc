# ~/.bashrc - executed by bash(1) for non-login shells

# Skip if not running an interactive prompt and this isn't an Xsession start
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Execute all indexed scripts in ~/.bash.d
for i in ~/.bash.d/[0-9][0-9]*.sh; do
  if [ -x "$i" ]; then
    . $i
  fi
done

unset i

export NVM_DIR=$HOME/.nvm
[[ -s $NVM_DIR/nvm.sh ]] && source $NVM_DIR/nvm.sh
[[ -s $NVM_DIR/bash_completion ]] && source $NVM_DIR/bash_completion

export RVM_DIR=$HOME/.rvm
[[ -s $RVM_DIR/scripts/rvm ]] && source $RVM_DIR/scripts/rvm && rvm use system > /dev/null

export SDKMAN_DIR=$HOME/.sdkman
[[ -s $SDKMAN_DIR/bin/sdkman-init.sh ]] && source $SDKMAN_DIR/bin/sdkman-init.sh
