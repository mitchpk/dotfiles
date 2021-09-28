set -x TERMINAL "alacritty"
set -x EDITOR "nvim"
set -x npm_config_prefix "$HOME/.local"

set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

alias v nvim

if [ -f ~/quotes/quotes ]
	function quote
		if test (count $argv) -gt 0
			set -l pwd (pwd)
			cd ~/quotes
			git pull > /dev/null
			echo $argv >> quotes
			git commit -am "new quote" > /dev/null
			git push > /dev/null
			cd $pwd
		else
			random choice (cat ~/quotes/quotes)
		end
	end

	function fish_greeting
		cowsay (random choice (cat ~/quotes/quotes))
	end
end

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
    exec sway
end
