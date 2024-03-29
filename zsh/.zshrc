#!/bin/zsh

# Source Prezto.
PROMPT_SYMBOL="❯"
PROMPT_ALTERNATE_SYMBOL="❮"
source "$HOME/.zprezto/init.zsh"


export GPG_TTY=$(/usr/bin/tty)
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
	export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi

configs=(
	03-bindkeys.zsh
	06-syntax-rules.zsh
	21-aliases.zsh
	20-functions.zsh
	07-zstyle.zsh
)

for config in $configs; do
	configfile=$XDG_CONFIG_HOME/zsh/$config
	if [[ -s "$configfile" ]]; then
		source $configfile
	fi
done

eval $(dircolors ~/.dircolors)
eval $(keychain --eval --quiet  ~/.ssh/godship_id_rsa )
eval "$(direnv hook zsh)"

export PATH="/home/victor/.yarn/bin:$PATH"

fortune
