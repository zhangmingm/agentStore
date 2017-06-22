PRG="$0"
PRGDIR=`dirname "$PRG"`
AGENTHOME=`cd "$PRGDIR/.." ; pwd`

. $AGENTHOME/bin/setenv.sh

PRO_KEY=SMSSenderWs
echo "webservice will be shutdown"
echo "shutdown  ..."
sleep 1
sh $AGENTHOME/bin/killer ${LOGNAME} ${PRO_KEY}
echo "check agent status..."
sleep 1
PRO_COUNT=`ps -ef  |grep ${PRO_KEY} | grep -v grep | wc -l`

if [ ${PRO_COUNT} -lt 1 ]
then
    echo "webservice has shutdown!"
else
    echo "webservice shutdown failed!"
fi