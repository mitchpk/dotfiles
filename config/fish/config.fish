set -x TERMINAL "alacritty"
set -x EDITOR "nvim"
set -x npm_config_prefix "$HOME/.local"
set -x COLORTERM truecolor

set -g theme_display_date no

bind \cd delete-char

alias grub-update "sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias psg "ps aux | grep -v grep | grep -i -e VSZ -e"
alias pars "paru -Slq | fzf -m --preview 'paru -Si {1}' | xargs -ro paru -S"
alias pacs "pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pacr "pacman -Qq | fzf -m --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias pacc "pacman -Qtdq | xargs -ro sudo pacman -Rns"
alias ls "exa --git"
alias multiget "aria2c -s 128"

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

function portscan
    timeout 1 \
    /bin/bash -c "echo > /dev/tcp/$argv[1]/$argv[2]" 2>/dev/null \
    && echo "$argv[1]:$argv[2] open"
end

if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec Hyprland
    end
end
