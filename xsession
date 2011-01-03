#!/bin/sh

# Only needed for Ubuntu/Debian

#SSH_IDENTITY=id_rsa
#ssh-add ~/.ssh/$SSH_IDENTITY
#if [ `ssh-add -l | grep $SSH_IDENTITY | wc -l` -eq 1 ]; then
#    keychain --quiet ~/.ssh/$SSH_IDENTITY
#    . ~/.keychain/`uname -n`-sh > /dev/null
#fi

. ~/.bash_profile

exec x-session-manager
