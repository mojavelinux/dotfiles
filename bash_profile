# ~/.bash_profile: executed by bash(1) for login shells.

# activate ssh-agent for id_rsa key NOTE This is now handled by the gnome-keyring-daemon on login
#keychain -q id_rsa && source ~/.keychain/$HOSTNAME-sh

# NOTE Seems like we only have to run gnome-keyring-daemon once, then it gets linked to the login event
#if [ -n "$DESKTOP_SESSION" ]; then
#    eval $(gnome-keyring-daemon --start --components=ssh)
#    export SSH_AUTH_SOCK
#fi

if [ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

umask 0022

# add a path to PATH
# later path declarations "win" unless qualified with "after"
pathmunge() {
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
}

pathmunge /usr/sbin # Red Hat doesn't like to give us this by default

. ~/.bash.d/homes.sh
#pathmunge $JAVA_HOME/bin
#pathmunge $GROOVY_HOME/bin
#pathmunge $GRADLE_HOME/bin
#pathmunge $ANT_HOME/bin
#pathmunge $MAVEN_HOME/bin
pathmunge $ECLIPSE_HOME
pathmunge $ANDROID_HOME/tools
pathmunge $GLASSFISH_HOME/bin
pathmunge $FORGE_HOME/bin
#pathmunge $PYTHON_EXT_HOME/bin
#pathmunge $GEM_HOME
#if [ -d $USER_GEM_HOME/bin ]; then
#    pathmunge $USER_GEM_HOME/bin
#fi
#pathmunge $JRUBY_HOME/bin
#pathmunge $JYTHON_HOME/bin
#pathmunge $MOZILLA_FIVE_HOME
pathmunge $HOME/opt/b-folders
#pathmunge $HOME/opt/phantomjs/bin
#pathmunge $HOME/opt/ghostscript
# NOTE install "global" npm packages using `npm install -g <package>` (prefix configured in $HOME/.npmrc)
#pathmunge $HOME/opt/npm/bin
#pathmunge $HOME/.jenv/bin
#pathmunge $HOME/.rvm/bin
pathmunge $HOME/.yarn/bin

if [ -d ~/bin ] ; then
    pathmunge ~/bin
fi

if [ -d ~/local/bin ]; then
    pathmunge ~/local/bin
fi

export PATH

# why remove pathmunge? seems useful; move function to .bash.d/01alias.sh
unset pathmunge
unset USERNAME
