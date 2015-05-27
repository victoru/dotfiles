#
# Executes commands at login post-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code that does not affect the current session in the background.
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )); then
  if [[ -t 0 || -t 1 ]]; then
    fortune -s
    print
  fi
fi

echo
echo "
A human being should be able to change a diaper, plan an invasion, butcher 
a hog, conn a ship, design a building, write a sonnet, balance accounts, 
build a wall, set a bone, comfort the dying, take orders, give orders, 
cooperate, act alone, solve equations, analyze a new problem, pitch manure,
program a computer, cook a tasty meal, fight efficiently, die gallantly. 
Specialization is for insects."
echo
