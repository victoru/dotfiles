#!/bin/sh

set -u
CROP_SIZE=${CROP_SIZE:-"80x80"}
DISPOSE=${DISPOSE}
DELAY=${DELAY}
LOOP=${LOOP:-0}
echo convert -dispose ${DISPOSE} -delay ${DELAY} -loop 0 ${SRC_IMG}  -crop ${CROP_SIZE} +repage ${DST_IMG}
