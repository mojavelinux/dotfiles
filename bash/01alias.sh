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
alias lh='ls -ad -I .?*'
alias llh='ls -lad -I .?*'
alias l='ls'
alias df='df -h'
alias j='jobs'
alias gpg='gpg2'
alias path='readlink -f'
# For advanced which, must install which deb from www.xs4all.nl/~carlo17/which
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'

# Alias to reload bachrc
alias reload='. ~/.bashrc'
alias flush='history -c && reset'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Program aliases
alias dockerpurge='docker rm $(docker ps --no-trunc -aq)'
alias unlock="keychain -q id_rsa && source ~/.keychain/$HOSTNAME-sh"
alias yumc='yum -C'
alias sshx='ssh -X'
alias virtsh='virsh'
alias pkginfo='repoquery -C -i'
alias v="vim"
alias vd="vimdiff"
alias view="vim -R"
#alias vless="/usr/share/vim/vim73/macros/less.sh"
alias vless=`rpm -ql vim-common | grep less.sh`
alias vimnosyn="vim -c 'set syntax='"
alias open='gnome-open'
alias ftp='ncftp'
alias ftpb='ncftpbookmarks'
alias jad='jad -s java'
alias img='identify'
alias qiv='/usr/bin/qiv -it'
alias qivf='/usr/bin/qiv -ift'
alias qivt='/usr/bin/qiv -pit'
alias qivft='/usr/bin/qiv -pift'
alias eogf='eog -f'
alias validate='xmllint --noout --valid'
alias timestamp='date +%s'
alias isodate='date +%Y-%m-%dT%H:%M:%S'
alias weather='curl http://wttr.in/Lone+Tree,CO'
alias xterm="xterm -bg black -fg white"
alias et="/usr/bin/time -f %e"
alias evolution.shutdown="evolution --force-shutdown"
alias wine.shutdown="killall wine-preloader"
alias myip="/sbin/ifconfig | grep -o 'inet addr:[^ ]*' | sed 's/inet addr://' | grep -v '127.0.0.1'"
alias phplint='php -l'
alias gdl='gradle'
alias mci='mvn clean install'
alias mdt='mvn dependency:tree | vim -'
alias histup='history -r'
alias links='elinks'
alias mm='middleman'
alias aweserve='awestruct -d'
alias a2html5="asciidoc -b html5 -a icons -a theme=default -a data-uri -a toc2 -a pygments"
alias a2pdf="a2x -fpdf -dbook --fop --icons --icons-dir=$HOME/.asciidoc/themes/default/icons"
alias a2docbook='a2x -fdocbook -dbook'
# use rvm gemset empty instead
alias purgejgems='jgem list | cut -d" " -f1 | xargs jgem uninstall -aIx'
alias purgegems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias format='astyle -n -U -a -j -f'
function _run_clojure_repl() { java $JAVA_OPTS -cp /usr/share/java/jline.jar:/usr/share/java/clojure.jar jline.ConsoleRunner clojure.main -i $HOME/.clojure/init.clj -r "$@"; }
alias clojurepl='_run_clojure_repl'
alias list-gsettings='gsettings list-recursively'
alias bfg="java -jar $HOME/bin/bfg-1.12.5.jar"
alias be='bundle exec'
alias fjruby='jruby -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-Xverify:none'
alias loadrvm="source $HOME/.rvm/scripts/rvm"
alias gemdir='cd $(rvm gemdir)/gems'
alias gemset='rvm gemset name'
#alias asciidoctor-local="$HOME/projects/asciidoctor/asciidoctor/bin/asciidoctor"
alias asciidoctor-dev="$HOME/projects/asciidoctor/asciidoctor/bin/asciidoctor"
#alias asciidoctor-pdf-local="$HOME/projects/asciidoctor/asciidoctor-pdf/bin/asciidoctor-pdf"
alias asciidoctor-pdf-dev="$HOME/projects/asciidoctor/asciidoctor-pdf/bin/asciidoctor-pdf"
#alias asciidoctor-epub3-local="$HOME/projects/asciidoctor/asciidoctor-epub3/bin/asciidoctor-epub3"
alias asciidoctor-epub3-dev="$HOME/projects/asciidoctor/asciidoctor-epub3/bin/asciidoctor-epub3"
alias asciidoctorjruby='rvm use jruby@asciidoctor-dev'
alias asciidoctor24='rvm use 2.4@asciidoctor-dev'
alias asciidoctor23='rvm use 2.3@asciidoctor-dev'
alias asciidoctor22='rvm use 2.2@asciidoctor-dev'
alias asciidoctor21='rvm use 2.1@asciidoctor-dev'
alias asciidoctor20='rvm use 2.0@asciidoctor-dev'
alias asciidoctor19='rvm use 1.9.3@asciidoctor-dev'
alias asciidoctor18='rvm use 1.8.7@asciidoctor-dev'
alias asciidoctorrbx='rvm use rbx-2.5.2@asciidoctor-dev'
alias asciidoctordemo='rvm use 2.1@asciidoctor-demo'
alias asciidoctorbench='rvm use 2.1@asciidoctor-bench'
alias awestruct19='rvm use 1.9.3@awestruct'
alias awestruct20='rvm use 2.0.0@awestruct'
alias jawestruct='rvm use jruby@awestruct'
alias awestruct-dev="$HOME/projects/awestruct/awestruct/bin/awestruct"

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
function java_major_version() { java -version 2>&1 | head -1 | grep -o '1\.\([678]\)\.' | cut -d '.' -f2; }
#alias java6="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-6-oracle/bin;\"`
#export JAVA_HOME=$HOME/opt/java-6-oracle
#export JAVA_MAJOR_VERSION=6"
#alias java7="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-7-openjdk/bin;\"`
#export JAVA_HOME=$HOME/opt/java-7-openjdk
#export JAVA_MAJOR_VERSION=7"
#alias java8="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;:/home/dallen/opt/java-8-oracle/bin;\"`
#export JAVA_HOME=$HOME/opt/java-8-oracle
#export JAVA_MAJOR_VERSION=8"
#alias javasystem="export PATH=`echo $PATH | sed \"s;:$HOME/opt/java\(-[^/]*\)\?/bin;;\"`
#unset JAVA_HOME
#unset JAVA_MAJOR_VERSION"
