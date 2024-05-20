# source aliases
source $HOME/aliases.zsh

# source keybinds
source $HOME/keybinds.zsh
# path updates
export PATH=$HOME/.local/bin:$PATH
# soucce zsh plugins
for plugin_file ($HOME/.zsh/**/*.plugin.zsh(N)); do
     source "$plugin_file"
		done

# zsh completions
autoload -U compinit
compinit -i
 
# zellij
ZELLIJ_AUTO_ATTACH=true
eval "$(zellij setup --generate-auto-start zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
