#!/bin/sh
PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`
. ${AGENTHOME}/bin/setenv.sh

KEY_SUFFIX=SMSSenderWs
PRO_KEY=QiCloud:name_${KEY_SUFFIX}

AGT_CLASS="tools.StartWsServer"

PRO_COUNT=`ps -ef  |grep ${PRO_KEY} | grep -v grep | wc -l`

java -version

if [ ${PRO_COUNT} -lt 1 ]
then
    nohup java -Xmx512m -D${PRO_KEY} -Dsun.lang.ClassLoader.allowArraySyntax=true -Djavax.management.builder.initial=mx4j.server.MX4JMBeanServerBuilder ${AGT_CLASS} > ../logs/logger.log &
    echo "webservice started!"
else
    echo "there is already ${PRO_COUNT} process with key ${PRO_KEY} exists"
fi