#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
eval "$(direnv hook zsh)"
eval $(thefuck --alias)


## DICTIONARY FUNCTIONS ##
dwordnet () { curl -SsL dict://dict.org/d:${1}:wn; }
dacron () { curl -SsL dict://dict.org/d:${1}:vera; }
djargon () { curl -SsL dict://dict.org/d:${1}:jargon; }
dfoldoc () { curl dict://dict.org/d:${1}:foldoc; }
dthesaurus () { curl dict://dict.org/d:${1}:moby-thes; }

alias xsel=pbcopy
alias x=pbcopy
alias k=kubectl

export PATH=~/bin/adr-tools/src:~/bin:$PATH

#export NVM_DIR="$HOME/.nvm"
#. "/usr/local/opt/nvm/nvm.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



alias in='task add +in'
tickle () {
    deadline=$1
    shift
    in +tickle wait:$deadline $@
}
alias tick=tickle

defer() {
    # defer N <time> [<comment>] @
    tasknum=$1
    waittime=$2
    comment="$3"
    # task $tasknum modify -in +waiting
    # task $tasknum annotate wait:+1d "Check: Call Dave and ask about the car tires."
}

plugins=(zsh-completions zsh-iterm-touchbar)
autoload -U compinit && compinit
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

