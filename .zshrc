#!/bin/zsh

for c in $HOME/etc/zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $c"
    fi
    source $c
done

eval `keychain --dir $HOME/etc/keychain -q --eval`

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git mercurial cpv encode64)

source $ZSH/oh-my-zsh.sh


echo "$(fortune)\n"
