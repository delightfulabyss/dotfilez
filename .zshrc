# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


export VISUAL=nvim
export EDITOR=nvim
export BROWSER="zen-browser"

# Directories


export DEV=$HOME/Dev
export FILESYNC=$HOME/Documents/Sync
export SCRIPTS=$HOME/Scripts



# ~~~~~~~~~~~~~~~ History ~~~~~~~~~~~~~~~~~~~~~~~~


HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_SPACE  # Don't save when prefixed with space
setopt HIST_IGNORE_DUPS   # Don't save duplicate lines
setopt SHARE_HISTORY      # Share history between sessions


# ~~~~~~~~~~~~~~~ Aliases & Functions ~~~~~~~~~~~~~~~~~~~~~~~~


source $HOME/aliases_functions.zsh


# ~~~~~~~~~~~~~~~ Key Bindings ~~~~~~~~~~~~~~~~~~~~~~~~


source $HOME/keybinds.zsh

# ~~~~~~~~~~~~~~~ Path ~~~~~~~~~~~~~~~~~~~~~~~~

setopt extended_glob null_glob

path=(
     $path # Keep existing PATH entries
     $HOME/bin
     $HOME/.local/bin
     $SCRIPTS
     $FILESYNC
 )

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH


# ~~~~~~~~~~~~~~~ Plugins ~~~~~~~~~~~~~~~~~~~~~~~~


source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-eza/zsh-eza.plugin.zsh
source $HOME/.zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source $HOME/.zsh/zsh-sudo/zsh-sudo.zsh


# ~~~~~~~~~~~~~~~ Completions ~~~~~~~~~~~~~~~~~~~~~~~~
autoload -U compinit
compinit -i
 

# ~~~~~~~~~~~~~~~ Initializations ~~~~~~~~~~~~~~~~~~~~~~~~


# Zellij
ZELLIJ_AUTO_ATTACH=true
eval "$(zellij setup --generate-auto-start zsh)"

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"
