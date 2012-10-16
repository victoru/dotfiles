for c in $HOME/etc/zsh/*.zsh; do
    if [[ $DEBUG > 0 ]]; then
        echo "zsh: sourcing $c"
    fi
    source $c
done

if [ -z "$TMUX" ]; then
    #
else
    export PROMPT_COMMAND='echo -ne "\033]2;${USER}@${HOSTNAME}: ${PWD}\007\033k${USER}@${HOSTNAME}\033\\"'
fi

function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}
