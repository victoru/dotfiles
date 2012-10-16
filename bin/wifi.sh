#/bin/sh

ESSID=`iwconfig 2>&1 | grep wlan0 | awk '{print $4}'`
ESSID=${ESSID:7:-1}

BIT=`iwconfig 2>&1 | grep "Bit Rate" | awk '{print $2}' | sed 's/Rate\=//'`
RATE=`iwconfig 2>&1 | grep "Bit Rate" | awk '{print $3}' ` #| sed 's/\//p'`

SIGNAL=$(printf "%.0f" `iwconfig 2>&1 | grep "Link Quality" | awk '{print $2}' | sed 's/.*\=//' | sed 's/\// /' | awk '{print let ($1/$2)*100}'`)

echo -n "$ESSID | $BIT $RATE | $SIGNAL%"

