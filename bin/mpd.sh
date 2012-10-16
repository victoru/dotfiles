#!/bin/sh

STATUS=`~/bin/mpd.awk`
TITLE=`mpc-socket | head -n 1`
MTIME=`mpc-socket | head -n 2 | tail -n 1 | awk '{print $3}'`

echo -n "$STATUS|$TITLE|$MTIME"
