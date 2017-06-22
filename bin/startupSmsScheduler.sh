#!/bin/sh
PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`
. ${AGENTHOME}/bin/setenv.sh

#generate process key
##KEY_SUFFIX=`date +%Y%m%d%H%M%S%s`
KEY_SUFFIX=SMSScheduler
PRO_KEY=QiCloud:name_${KEY_SUFFIX}

echo ${PRO_KEY} > ./key

AGT_CLASS="tools.StartGzgsSmsSender"

PRO_COUNT=`ps -ef  |grep ${PRO_KEY} | grep -v grep | wc -l`

java -version

if [ ${PRO_COUNT} -lt 1 ]
then
    nohup java -Xmx512m -D${PRO_KEY} -Dsun.lang.ClassLoader.allowArraySyntax=true -Djavax.management.builder.initial=mx4j.server.MX4JMBeanServerBuilder ${AGT_CLASS} > ../logs/logger.log &
    echo "sms sender started!"
else
    echo "there is already ${PRO_COUNT} process with key ${PRO_KEY} exists"
fi