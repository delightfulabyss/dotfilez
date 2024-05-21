# aliases
alias v="nvim"
alias ds='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew status'
alias da='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew add'
alias dc='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew commit -m'
alias dp='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew push'
alias du='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew pull'
alias di='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew diff'
alias dsa='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew submodule add'
alias dsu='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew submodule update --init --recursive'
alias sp="sudo system76-power"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		 cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
