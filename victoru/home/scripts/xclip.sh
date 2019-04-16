#!/bin/zsh
# An xclip-like wrapper to pbcopy/pbpaste so I don't need a ton of OS-specific
# conditionals littering my dotfiles in order to work on OSX. This wrapper is
# NOT comprehensive and generally only covers the functionality actually used
# in my dotfiles.

local opts direction

# Consume and ignore the selection flags but save -i and -o.
zparseopts -E -D -a opts -- -select: -selection: i=direction o=direction

if [[ "${direction[1]}" == "-o" ]]; then
    pbpaste
else
    pbcopy
fi
