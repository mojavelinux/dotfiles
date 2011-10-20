#!/bin/bash

# If not running interactively, don't do anything (don't run on Xsession start)
[ -z "$PS1" ] && return

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
   test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
   alias ls='ls --color=auto'
   alias dir='dir --color=auto'
   alias vdir='vdir --color=auto'
   alias grep='grep --color --exclude *.svn*'
   alias fgrep='fgrep --color=auto --exclude *.svn*'
   alias egrep='egrep --color=auto --exclude *.svn*'
fi

#function find { /usr/bin/find "$@" \( ! -name .svn -o -prune \); }
#function find { /usr/bin/find "$@" \( \! -regex '.*/\(target\|\.svn\(/.*\)?\)$' \); }
#function locate { /usr/bin/locate "$@" | grep -v .svn; }
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
function cdls() { cd "$1" && ls; }

# Common file command aliases
alias cd..='cd ..'
alias cd.1='cd ..'
alias cd.2='cd ../..'
alias cd.3='cd ../../..'
alias cd.4='cd ../../../..'
alias cd.5='cd ../../../../..'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias df='df -h'
alias path='readlink -f'
# For advanced which, must install which deb from www.xs4all.nl/~carlo17/which
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# Alias to reload bachrc
alias reload='. ~/.bashrc'
alias flush='history -c && reset'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Program aliases
alias sshx='ssh -X'
alias v="vim"
alias vd="vimdiff"
alias ftp='ncftp'
alias ftpb='ncftpbookmarks'
alias jad='jad -s java'
alias qiv='/usr/bin/qiv -it'
alias qivf='/usr/bin/qiv -ift'
alias qivt='/usr/bin/qiv -pit'
alias qivft='/usr/bin/qiv -pift'
alias validate='xmllint --noout --valid'
alias xterm="xterm -bg black -fg white"
alias evolution.shutdown="evolution --force-shutdown"
alias wine.shutdown="killall wine-preloader"
alias myip="/sbin/ifconfig | grep -o 'inet addr:[^ ]*' | sed 's/inet addr://' | grep -v '127.0.0.1'"
alias phplint='php -l'
alias gdl='gradle'
alias mci='mvn clean install'
alias mdt='mvn dependency:tree | vim -'
alias histup='history -r'
alias links='elinks'
alias aweserve='awestruct --auto --server'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function say() { espeak -a20 -p90 "$@" 2> /dev/null ; }

alias tailjb='tail -f server/default/log/server.log'
alias tailgf='tail -f glassfish/domains/domain1/logs/server.log'

# CVS aliases
alias cvscheck='cvs -nq update -Pd 2>&1 | grep -v "cvs update: New directory"'
alias cvsup='cvs -q update -Pd 2>&1 | grep -v "cvs update: New directory"'

# SVN aliases
alias svncheck='svn merge --dry-run -r BASE:HEAD .'

# swap Java version aliases
# also see http://gist.github.com/23190
# also see http://blog.emmanuelbernard.com/2011/01/script-to-hot-switch-jdk-versions-in-mac-os-x/
alias java6="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-6-openjdk/bin;\"`
export JAVA_HOME=$HOME/opt/java-6-openjdk
export JAVA_MAJOR_VERSION=6"
alias java7="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-7-openjdk/bin;\"`
export JAVA_HOME=$HOME/opt/java-7-openjdk
export JAVA_MAJOR_VERSION=7"
#alias java5="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-5-sun/bin;\"`
#export JAVA_HOME=$HOME/opt/java-5-sun
#export JAVA_MAJOR_VERSION=5"
