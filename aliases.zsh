# aliases
alias v="nvim"
alias dotz='/usr/bin/git --git-dir=/home/matthew/.dotfilez/ --work-tree=/home/matthew'
alias sp="sudo system76-power"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		 cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
