# ~/.bash_profile - executed by bash(1) for login shells

umask 0022

# activate ssh-agent for id_rsa key (for remote logins only)
#keychain -q id_rsa && source ~/.keychain/$HOSTNAME-sh

# Get the aliases and functions
# Also see .inputrc for bash options and keybindings
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

#pathmunge /usr/sbin
if [ -d ~/bin ]; then
  pathmunge ~/bin
fi
pathmunge $RVM_DIR/bin
pathmunge $HOME/.yarn/bin

export PATH
