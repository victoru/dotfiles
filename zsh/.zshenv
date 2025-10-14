#
# Defines environment variables.

#export ZDOTDIR="${XDG_CONFIG_HOME}"
#export -TU PERL5LIB perl5lib

export BIN_HOME="$HOME/bin"
export GOPATH=$HOME/go

export BROWSER='firefox'
export EDITOR='nvim'
export GIT_EDITOR=nvim
#export VISUAL='nvim-qt'
#export PAGER='vimpager'
#export MANPAGER=$PAGER

export SAVEHIST=10000
export HISTSIZE=10000 #determines the number of lines the shell will keep within one session
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export DISPLAY=:0

export PWD=$(pwd)
export MPD_HOST="$HOME/.mpd/socket"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u $USER)/bus

export XDG_CONFIG_HOME=$HOME/etc
export XDG_CACHE_HOME=$HOME/etc/cache
export XDG_DATA_HOME=$HOME/var
export XDG_RUNTIME_DIR=/run/user/1000
# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
  systemctl --user import-environment PATH DBUS_SESSION_BUS_ADDRESS
fi
