# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export HISTFILE="$HOME/.zsh_history"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
setopt INC_APPEND_HISTORY # Save history entries as soon as they are entered
setopt SHARE_HISTORY # Share history between multiple zsh sessions
# Man pages
 export MANPAGER='nvim +Man!'

# path
if [ -d "$HOME/.local/bin" ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi
