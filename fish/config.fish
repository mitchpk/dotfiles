set -x EDITOR "nvim"
set -x COLORTERM truecolor
set -x npm_config_prefix "$HOME/.local"
set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

set -g theme_display_date no

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
