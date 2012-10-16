#!/bin/bash
# by Paul Colby (http://colby.id.au), no rights reserved ;)

# change this with your temporary files
TMP1="/dev/shm/cpu$1usage.total"
TMP2="/dev/shm/cpu$1usage.idle"

if [ ! -s "$TMP1" ]; then
	touch "$TMP1"
	echo 0 > "$TMP1"
fi

if [ ! -s "$TMP2" ]; then
	touch "$TMP2"
	echo 0 > "$TMP2"
fi

#PREV_TOTAL=0
#PREV_IDLE=0


#while true; do
  PREV_TOTAL=`cat ${TMP1}`
  PREV_IDLE=`cat ${TMP2}`

  CPU=(`cat /proc/stat | grep cpu$1 | head -n 1`)
  #CPU=(`cat /proc/stat | grep '^cpu '`) # Get the total CPU statistics.
  unset CPU[0]                          # Discard the "cpu" prefix.
  IDLE=${CPU[4]}                        # Get the idle CPU time.

  # Calculate the total CPU time.
  TOTAL=0
  for VALUE in "${CPU[@]}"; do
    let "TOTAL=$TOTAL+$VALUE"
  done

  # Calculate the CPU usage since we last checked.
  let "DIFF_IDLE=$IDLE-$PREV_IDLE"
  let "DIFF_TOTAL=$TOTAL-$PREV_TOTAL"
  let "DIFF_USAGE=((1000*($DIFF_TOTAL-$DIFF_IDLE)/$DIFF_TOTAL+5)/10)"
  #printf "%.1f" $DIFF_USAGE

  echo -n "$DIFF_USAGE"
  #printf "%.02f" `echo "$DIFF_USAGE*0.01" | bc`

  # Remember the total and idle CPU times for the next check.
  #PREV_TOTAL="$TOTAL"
  #PREV_IDLE="$IDLE"
  echo $TOTAL > "$TMP1"
  echo $IDLE > "$TMP2"

  # Wait before checking again.
#  sleep 1
#done
