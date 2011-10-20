# ~/.bash_profile: executed by bash(1) for login shells.

#keychain id_rsa 2>/dev/null

if [ -n "$BASH_VERSION" ] && [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

umask 0022;
pathmunge () {
    if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
       if [ "$2" = "after" ] ; then
          PATH=$PATH:$1
       else
          PATH=$1:$PATH
       fi
    fi
}

pathmunge /usr/sbin # Red Hat doesn't like to give us this by default

. ~/.bash/homes.sh
pathmunge $JAVA_HOME/bin
pathmunge $GROOVY_HOME/bin
pathmunge $ANT_HOME/bin
pathmunge $MAVEN_HOME/bin
pathmunge $ECLIPSE_HOME
pathmunge $ANDROID_HOME/tools
pathmunge $GRADLE_HOME/bin
pathmunge $GLASSFISH_HOME/bin
pathmunge $FORGE_HOME/bin
pathmunge $PYTHON_EXT_HOME/bin
pathmunge $GEM_HOME/bin
pathmunge $JRUBY_HOME/bin
#pathmunge $MOZILLA_FIVE_HOME
if [ -d ~/bin ] ; then
    pathmunge ~/bin
fi

if [ -d ~/local/bin ]; then
    pathmunge ~/local/bin
fi

export PATH
unset pathmunge
unset USERNAME
