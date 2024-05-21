# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Man pages
 export MANPAGER='nvim +Man!'

# path
if [ -d "$HOME/.local/bin" ] ; then
     PATH="$HOME/.local/bin:$PATH"
fi
