function zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle-line-init() {     
    #zle -K vicmd;
    zle-keymap-select
}
zle -N zle-line-init
zle -N zle-keymap-select
