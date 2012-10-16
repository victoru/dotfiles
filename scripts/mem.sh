#/bin/bash

VALS=`free -m | grep 'cache:' | sed 's/.*://g'`

USED=`echo $VALS | awk '{print $1}'`
FREE=`echo $VALS | awk '{print $2}'`
let TOTAL=$USED+$FREE


echo "$USED/$TOTAL"
#echo $USED
#echo $TOTAL
