#!/bin/bash


case $1 in
    signal )
        s=$(printf "%.0f" `iwconfig 2>&1 | grep "Link Quality" | 
                    awk '{print $2}' | sed 's/.*\=//' | sed 's/\// /' | 
                    awk '{print let ($1/$2)*100}'`)
        echo -n $(printf "%03d" $s)
        ;;
    inet )
        echo -n $(ifconfig wlan0 | grep inet\ | awk '{print $2}')
        ;;
    inet6 )
        echo -n $(ifconfig wlan0 | grep inet6 | head -n 1 | awk '{print $2}')
        ;;
    essid )
        ESSID=`iwconfig 2>&1 | grep wlan0 | awk '{print $4}'`
        ESSID=${ESSID:7:-1}
        echo -n $ESSID
        ;;
    *)
        ESSID=`iwconfig 2>&1 | grep wlan0 | awk '{print $4}'`
        ESSID=${ESSID:7:-1}

        BIT=`iwconfig 2>&1 | grep "Bit Rate" | awk '{print $2}' | sed 's/Rate\=//'`
        RATE=`iwconfig 2>&1 | grep "Bit Rate" | awk '{print $3}' ` #| sed 's/\//p'`

        SIGNAL=$(printf "%.0f" `iwconfig 2>&1 | grep "Link Quality" | awk '{print $2}' | sed 's/.*\=//' | sed 's/\// /' | awk '{print let ($1/$2)*100}'`)

        echo -e "ESSID: $ESSID\nRate: $BIT $RATE\nSignal Strength: $SIGNAL%"
        ;;

esac


