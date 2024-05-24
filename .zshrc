# source aliases
source $HOME/aliases.zsh

# source keybinds
source $HOME/keybinds.zsh
# path updates
export PATH=$HOME/.local/bin:$PATH
# soucce zsh plugins
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $HOME/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOME/.zsh/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
source $HOME/.zsh/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source $HOME/.zsh/zsh-eza/zsh-eza.plugin.zsh
source $HOME/.zsh/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source $HOME/.zsh/zsh-sudo/zsh-sudo.zsh

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
