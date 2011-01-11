#!/bin/bash

export JAVA_HOME=$HOME/opt/java
export JRE_HOME=$JAVA_HOME/jre
export JDK_HOME=$JAVA_HOME
export JAVA_MAJOR_VERSION=6
export GROOVY_HOME=$HOME/opt/groovy
export ANT_HOME=$HOME/opt/ant
export MAVEN_HOME=$HOME/opt/maven
export ECLIPSE_HOME=$HOME/opt/eclipse
export ANDROID_HOME=$HOME/opt/android-sdk-1.5
export GRADLE_HOME=$HOME/opt/gradle
export JBOSSAS_HOME=$HOME/opt/jboss-as
# legacy JBoss AS home
export JBOSS_HOME=$HOME/opt/jboss-as
#export JEDIT_HOME=$HOME/opt/jedit
#export GEM_HOME=/var/lib/gems/1.8
# we get a lot of fake mozilla/firefox directories, so detect a real one by looking for the chrome directory
#export MOZILLA_FIVE_HOME=`ls -1rd /usr/lib/*firefox*/chrome 2>/dev/null | head -1 | xargs dirname 2>/dev/null`
#if [ -d $HOME/.mozilla/plugins ] ; then
#    export MOZ_PLUGIN_PATH=$HOME/.mozilla/plugins
#fi
#export CATALINA_HOME=$HOME/opt/tomcat
