#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Paths
# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

#Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{bin,.local/bin,node_modules/.bin,go/bin}
  /usr/{local/{bin,sbin},bin}
  $path
)

if [[ -f "/etc/zsh/zprofile" ]]; then
  . /etc/zsh/zprofile
fi

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
