set -x DPI (cat ~/.Xresources | grep -o 'dpi.*' | cut -f2- -d':' | sed -e 's/^[[:space:]]*//')
set -x BAR_HEIGHT (math "32 * ($DPI / 96)")
set -x TRAY_HEIGHT (math "$BAR_HEIGHT / 2")
set -x TERMINAL "alacritty"
set -x EDITOR "nvim"
set -x npm_config_prefix "$HOME/.local"
set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

set -g theme_display_date no

alias hx helix
alias grub-update "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias psg "ps aux | grep -v grep | grep -i -e VSZ -e"
alias pacs "pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pars "paru -Slq | fzf -m --preview 'paru -Si {1}' | xargs -ro paru -S"
alias pacr "pacman -Qq | fzf -m --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias ls "exa --git --icons"
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
        #cowsay (random choice (cat ~/quotes/quotes))
    end
end

if test $DPI -ge 144
	set -x GDK_SCALE 2
	set -x GDK_DPI_SCALE 0.5
end

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]
	exec startx
end
