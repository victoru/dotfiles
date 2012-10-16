source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#bindkey -v

bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
# End of lines configured by zsh-newuser-install

autoload -U promptinit
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U vcs_info && vcs_info
autoload -U add-zsh-hook
zmodload zsh/complist
zmodload zsh/terminfo

# setopt
setopt \
  autocd \
  ksh_glob \
  extendedglob \
  prompt_subst \
  inc_append_history


[ -n "$TMUX" ] && export TERM=screen-256color

alias pacman='pacman-color'
alias ls='ls --color=auto'
alias ll="ls -l"
alias chromium="chromium --allow-outdated-plugins"
alias adb=/opt/android-sdk/platform-tools/adb

# HOMEs
export XDG_CONFIG_HOME="$HOME/etc"
export XDG_CACHE_HOME="$HOME/etc/cache"
export XDG_DATA_HOME="$HOME/var"
export DEVEL_HOME="$HOME/dev"
export BIN_HOME="$HOME/bin"

export LANG="en_US.utf8"

export PATH="$PATH:$BIN_HOME"

export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE=$XDG_CONFIG_HOME/zsh/history
export DISPLAY=:0

export SHELL='/bin/zsh'
export EDITOR='vim'
export MANPAGER='vimpager'
export EDITOR="vim"
export PAGER="vimpager"
export MANPAGER='vimpager'
export PWD=$(pwd)

export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

fortune
echo
