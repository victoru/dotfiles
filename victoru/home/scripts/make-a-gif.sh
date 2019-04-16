#!/bin/bash

# convert -loop 0 -delay 100 in1.png in2.png out.gif
# -loop iterations     add Netscape loop extension to your GIF animation
convert -loop 0 -delay 100 $@
