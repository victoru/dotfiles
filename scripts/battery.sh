#!/bin/bash

STATUS=$( acpi | awk '{print $3}' )

if [ "$STATUS" = "Discharging," ]
then
        #STATUS="D"
        STATUS="Δ"
else
        #STATUS="AC"
        STATUS="ϟ"
fi

PERCENT=$( acpi | awk '{print $4}' )
PERCENT=${PERCENT%%"%,"}
PERCENT=${PERCENT%%"%"}
#PERCENT=${PERCENT%%","}
echo -n "$STATUS $PERCENT"
