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
getLeelooCommand () {
        lifecycle="${2:-app}"
        environment="$1"
        if [ -z "$environment" ]
        then
                echo 'getLeelooCommand: environment not specified' >&2
                return 2
        fi
        cmd="deploy lifecycle ${lifecycle} of $(basename "$(git rev-parse --show-toplevel)"):$(git rev-parse --abbrev-ref HEAD) to ${environment}"
        if [ -z "$(which pbcopy)" ]; then
            pbcopy() { 2>&1 < /dev/null }
        fi
        echo "$cmd" | tee /dev/tty | pbcopy
}
alias glc=getLeelooCommand

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
alias s=spotify

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

source $(which aws_zsh_completer.sh)
# . /Users/victorunegbu/.nix-profile/etc/profile.d/nix.sh

cat - <<EOF
.　　　　　　　　　　 ✦ 　　　　   　 　　　˚　　　　　　　　　　　　　　　　　　　　   　　　　　　　　　　　　　.　　　☄　　　　　　　　 　　　. 　　 　　　　　　　 ✦ 　　　　　　　　　　 　     　　　　 　　　　　　　　　　　　,　　   　 .　　　　　　　　　　　　　.　　　ﾟ　  　　　.　　　　　　　　　　　　　✦ 　　　　　　,　　　　　　　.　　　　　　    　　　　 　　　　　　　　　　　　　　　　　　  . ☀️ 　　　　　　　　　　　　　　　　　　    　      　　　　　        　　　　　　　　　　　　　. 　　　　　　　　.　　　　　　　　　　　　　.　　　　　　       　   　　　　 　　　　　　　　　　　　　　　　       　   　　　　　　　　　　　　　　　　       　    ✦ 　   　　　,　　　　　　　　　　　  　　　　 　　,　　　     　 　　　　　　　　　　　　.　　　　　 　　 　　　.　　　　　　　　　　　　　 　           　　　　　　　　　　　　　　　　　　　. ˚　　　 　   . ,　　　　　　　　　　　       　    　　　　　　　　　　　　　. .　　　  　　    ✦　 ✦　　　　 　　　　　.　　　　　　　　　　　　　.　　　　　　　　　　　　　　　 　　   　　　　　 ✦ 　　　　　　　         　        　　　　 　　 　　　　　　　 　　　　　.　　　　　　　　　　　　　　　　　　.　　　　　    　　. 　 　　　　　.　　　　 　　　　　   　　　　　.　　　　　　　　　　　.　　　　　　　　　　   　 　˚　　 . ✦ ✦　　　　　　　　　　　　　　　　　　　ﾟ　　　　　.　　　　　　　　　　　　　　　. 　　 　 🌎           ,　 　　　　　　　　　　　　　　* .　　　　　 　　　　　　　　　　　　　　.　　　　　　　　　　 ✦ 　　　　   　 　　　˚　　　　　　　　　　　　　　*　　　　　　   　　　　　　　　　　　　　　　.　　　　　　　　　　　　　　 ✦
EOF
#alias ls=sl
export AWS_SDK_LOAD_CONFIG=true

function foo() {
    # This loads nvm
    # &>/dev/null \. "$NVM_DIR/nvm.sh" &;
    \. "$NVM_DIR/nvm.sh" >/dev/null 2>&1 &;
}
#echo 1
export NVM_DIR="$HOME/.nvm"
#if [ -s "$NVM_DIR/nvm.sh" ]; then
    #&>/dev/null foo &
    #\. "$NVM_DIR/nvm.sh" &
##2>/dev/null
#fi
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh" --no-use # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias gpff='git pull --ff-only origin'
export GONOPROXY=github.com/rewardStyle
export GONOSUMDB=github.com/rewardStyle
export GOPRIVATE=github.com/rewardStyle
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/Users/victorunegbu/.config/nvim/node_modules/.bin:$PATH"
