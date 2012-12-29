#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -r "$HOME/.Xmodmap" ]] && xmodmap ~/.Xmodmap &

ps -C compton || compton -cGb

#urxvt daemon
ps -C urxvtd || urxvtd -q -o -f

#start mpd
ps -C mpd || mpd &

#start mpdsribble
ps -C mpdscribble || mpdscribble &

pcmanfm -d &

eval $(keychain --eval)

ps -C autocutsel
if [ $? -ne 0 ]; then
    autocutsel -fork &
    autocutsel -selection PRIMARY -fork &
fi
#screen powersave
xset +dpms
xset dpms 0 0 300

upower -e

i3 -V >> ~/.i3/log 2>&1

