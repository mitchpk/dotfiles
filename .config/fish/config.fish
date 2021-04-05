set -x DPI (cat ~/.Xresources | grep -o 'dpi.*' | cut -f2- -d':' | sed -e 's/^[[:space:]]*//')
set -x BAR_HEIGHT (math "36 * ($DPI / 96)")
set -x TRAY_HEIGHT (math "$BAR_HEIGHT / 2")

set -x _JAVA_OPTIONS '-Dawt.useSystemAAFontSettings=on'

if test $DPI -ge 144
	set -x GDK_SCALE 2
	set -x GDK_DPI_SCALE 0.5
end

if status is-interactive
    set -l onedark_options '-b'

    if set -q VIM
        # Using from vim/neovim.
        set onedark_options "-256"
    else if string match -iq "eterm*" $TERM
        # Using from emacs.
        function fish_title; true; end
        set onedark_options "-256"
    end

    set_onedark $onedark_options
end
