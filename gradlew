#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done
SAVED="$(pwd)"
cd "$(dirname "$PRG")/" >/dev/null
APP_HOME="$(pwd -P)"
cd "$SAVED" >/dev/null

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

# OS specific support. $var _must_ be set to either true or false.
cygwin=false
msys=false
darwin=false
case "$(uname)" in
  CYGWIN* ) cygwin=true ;;
  MINGW* ) msys=true ;;
  Darwin* ) darwin=true ;;
esac

# For Cygwin or MSYS, switch paths to Windows format before running java
if $cygwin || $msys ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
fi

if [ -n "$JAVA_HOME" ] ; then
    JAVA_HOME="$JAVA_HOME"
    JAVA_EXE="$JAVA_HOME/bin/java"
    if [ ! -x "$JAVA_EXE" ] ; then
        warn "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME"
        warn "Please set the JAVA_HOME variable in your environment to match the location of your Java installation."
        exit 1
    fi
else
    JAVA_EXE="java"
    which java >/dev/null 2>&1 || { warn "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH."; exit 1; }
fi

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

exec "$JAVA_EXE" $DEFAULT_JVM_OPTS $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@" 