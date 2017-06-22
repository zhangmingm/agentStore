
#!/bin/sh
if [ -f ~/.profile ];then
. ~/.profile
fi

# modify
JAVA_HOME=
bin=`dirname "$0"`
AGENT_HOME=`cd "$bin/.." ; pwd`

LIBS_HOME=${AGENT_HOME}/lib
PATH=${JAVA_HOME}/bin:${PATH}:/usr/sbin:/usr/bin:/etc
CLASSPATH=../resources:../lib/*
LANG=$LANG

export JAVA_HOME
export AGENT_HOME
export LIBS_HOME
export PATH
export CLASSPATH
export LANG
