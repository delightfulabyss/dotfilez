# aliases
alias v="nvim"
alias rz="source $HOME/.zshrc && echo '.zshrc reloaded!'"
alias sp="system76-power"
alias pacdiff="DIFFPROG='nvim -d' pacdiff -s"
alias d='/usr/bin/git --git-dir=/home/matthew/.dotfiles/ --work-tree=/home/matthew'
alias ds='d status'
alias da='d add'
alias dc='d commit -m'
alias dp='d push'
alias du='d pull --recurse-submodules'
alias di='d diff'
alias dsa='d submodule add'
alias dss='d submodule status'

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		 cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

function dsr() {
	d submodule deinit -f "$HOME/.zsh/$1"
  rm -rf "$HOME/.dotfilez/modules/$1"
	d rm -f "$HOME/.zsh/$1"
	# sed -i '/source $HOME\/.zsh\/'"$1"'/d' $HOME/.zshrc
}

# Avoid overwriting of keybinds in autoexecuted function by zsh-vi-mode
function zvm_after_init() {
    source $HOME/.zsh/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh
}

