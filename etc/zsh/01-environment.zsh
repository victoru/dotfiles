# HOMEs
export XDG_CONFIG_HOME="$HOME/etc"
export XDG_CACHE_HOME="$HOME/etc/cache"
export XDG_DATA_HOME="$HOME/var"
export DEVEL_HOME="$HOME/dev"
export BIN_HOME="$HOME/bin"
export PATH="$PATH:$BIN_HOME"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export DISPLAY=:0

export SHELL='/bin/zsh'
export EDITOR='vim'
export PAGER="vimpager"
export MANPAGER='vimpager'
export PWD=$(pwd)
export MPD_HOST="/home/victor/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

export LANG="en_US.utf8"
