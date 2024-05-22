# aliases
alias v="nvim"
alias d='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew'
alias ds='d status'
alias da='d add'
alias dc='d commit -m'
alias dp='d push'
alias du='d pull --recurse-submodules'
alias di='d diff'
alias dsa='d submodule add'
alias sp="sudo system76-power"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		 cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
