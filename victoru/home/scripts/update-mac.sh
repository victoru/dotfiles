#!/bin/sh

if [ "$1" = "--help" ]; then
    echo 'usage: ./update-mac [--reboot]'
    exit
fi

COMMAND_LINE_INSTALL=1
export COMMAND_LINE_INSTALL
CMD='softwareupdate -ia && echo Update downloaded. To complete finish installing this update, run: sudo reboot'
if [ "$1" = "--reboot" ]; then
    CMD='softwareupdate -ia --reboot'
fi
sudo -E sh -c "echo $CMD"
