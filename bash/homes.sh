#!/bin/bash

export SDKMAN_DIR=$HOME/.sdkman
export JAVA_HOME=$HOME/opt/java
#export JRE_HOME=$JAVA_HOME/jre
#export JDK_HOME=$JAVA_HOME
#export JAVA5_HOME=$JAVA_HOME/java-5-sun
#export JAVA_MAJOR_VERSION=`java -version 2>&1 | grep -o '1\.\([678]\)\.' | cut -d '.' -f2`
#export JAVA_OPTS='-Xshare:on'
#export GROOVY_HOME=$HOME/opt/groovy
#export GRADLE_HOME=$HOME/opt/gradle
#export ANT_HOME=$HOME/opt/ant
#export MAVEN_HOME=$HOME/opt/maven
export ECLIPSE_HOME=$HOME/opt/eclipse
export ANDROID_HOME=$HOME/opt/android-sdk
#export JBOSSAS_HOME=$HOME/opt/jboss-as
export JBOSS_HOME=$HOME/opt/wildfly
export GLASSFISH_HOME=$HOME/opt/glassfish
#export CATALINA_HOME=$HOME/opt/tomcat
#export PYTHON_EXT_HOME=$HOME/opt/python-ext
#export PYTHONPATH=$PYTHON_EXT_HOME/lib/python2.6/site-packages
export FORGE_HOME=$HOME/opt/forge
#export GEM_HOME=/var/lib/gems/1.8
export USER_GEM_HOME=$HOME/.gem/ruby/system
export TORQUEBOX_HOME=$HOME/opt/torquebox
#export JRUBY_HOME=$TORQUEBOX_HOME/jruby
#export JRUBY_HOME=$HOME/opt/jruby
#export JRUBY_OPTS='--server -J-Xverify:none -Xcext.enabled=true'
#export JRUBY_OPTS='-J-Xverify:none -Xcext.enabled=true'
#export JRUBY_OPTS='-Xcext.enabled=true'
#export EXECJS_RUNTIME=SpiderMonkey
#export JGEM_HOME=$JRUBY_HOME/lib/ruby/gems/1.8
#export JYTHON_HOME=$HOME/opt/jython
export MW_HOME=$HOME/opt/wls
# we get a lot of fake mozilla/firefox directories, so detect a real one by looking for the chrome directory
#export MOZILLA_FIVE_HOME=`ls -1rd /usr/lib/*firefox*/chrome 2>/dev/null | head -1 | xargs dirname 2>/dev/null`
#if [ -d $HOME/.mozilla/plugins ] ; then
#    export MOZ_PLUGIN_PATH=$HOME/.mozilla/plugins
#fi
#export R_LIBS=$HOME/opt/R
export ADB=$HOME/opt/android-sdk/platform-tools/adb
