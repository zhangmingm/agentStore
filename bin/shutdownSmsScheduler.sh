PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`

. $AGENTHOME/bin/setenv.sh

PRO_KEY=SMSScheduler
echo "sms sender will be shutdown"
echo "shutdown  ..."
sleep 1
sh $AGENTHOME/bin/killer ${LOGNAME} ${PRO_KEY}
echo "check agent status..."
sleep 1
PRO_COUNT=`ps -ef  |grep ${PRO_KEY} | grep -v grep | wc -l`

if [ ${PRO_COUNT} -lt 1 ]
then
    echo "sms sender has shutdown!"
else
    echo "sms sender shutdown failed!"
fi