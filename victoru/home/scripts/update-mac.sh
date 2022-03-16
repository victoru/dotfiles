#!/bin/sh

if [ "$1" = "--help" ]; then
    echo 'usage: ./update-mac [--reboot]'
    exit
fi

COMMAND_LINE_INSTALL=1
export COMMAND_LINE_INSTALL
CMD='softwareupdate -ia && echo Update downloaded. To complete finish installing this update, run: sudo reboot'
if [ "$1" = "--restart" ]; then
    CMD='softwareupdate -ia --restart'
fi
sudo -E sh -c "$CMD"
