#!/bin/sh
setxkbmap -option ctrl:nocaps
#setxkbmap -option terminate:ctrl_alt_bksp

xset +dpms
xset dpms 0 0 300

autocutsel -selection PRIMARY -fork
autocutsel -selection CLIPBOARD -fork

XFT_SETTINGS="
Xft.antialias:  1
Xft.autohint:   0
Xft.dpi:        96
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
"
echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1

export INFINALITY_FT_FRINGE_FILTER_STRENGTH="25"
export INFINALITY_FT_USE_VARIOUS_TWEAKS="true"
export INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH="25"
export INFINALITY_FT_STEM_ALIGNMENT_STRENGTH="15"
export INFINALITY_FT_STEM_FITTING_STRENGTH="15"
_1="04 22 38 22 04" # extra sharp
_2="06 22 36 22 06" # sharper & lighter ultimate
_3="08 24 36 24 08" # ultimate: well balanced (default)
_4="10 25 37 25 10" # darker & smoother
_5="12 28 42 28 12" # darkest & heaviest ("MacIsh")
export INFINALITY_FT_FILTER_PARAMS=$_4

if systemctl -q --user is-active desktop.target; then
    echo "ayy"
    exit 0
fi

systemctl --user import-environment \
    INFINALITY_FT_FRINGE_FILTER_STRENGTH \
    INFINALITY_FT_USE_VARIOUS_TWEAKS \
    INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH \
    INFINALITY_FT_STEM_ALIGNMENT_STRENGTH \
    INFINALITY_FT_STEM_FITTING_STRENGTH \
    INFINALITY_FT_FILTER_PARAMS

systemctl --user start desktop.target
while systemctl -q --user is-active desktop.target; do
    sleep 1s
done
echo "welcome back!"
