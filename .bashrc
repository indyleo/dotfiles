# My .Bashrc Config

# Exports
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Applications:$PATH"
export PATH="/var/lib/flatpak/exports/bin/:$PATH"
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export EDITOR="nvim" 
export VISUAL="nvim"
export PAGER="moar"
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries

# SHOPT
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

# Set keybingings to vi
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

# Startup Stuff
 # neofetch
 # pfetch

# Aliases
source $HOME/.aliasrc 2>/dev/null

# Starship prompt
eval "$(starship init bash)"

# Rustup
. "$HOME/.cargo/env"
