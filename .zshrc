source $HOME/aliases.zsh

# zsh completions
autoload -U compinit; compinit -i
 
# zellij
ZELLIJ_AUTO_ATTACH=true
eval "$(zellij setup --generate-auto-start zsh)"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"
