set -x DPI (cat ~/.Xresources | grep -o 'dpi.*' | cut -f2- -d':' | sed -e 's/^[[:space:]]*//')

set -x BAR_HEIGHT (math "36 * ($DPI / 96)")

if test $DPI -ge 144
	set -x GDK_SCALE 2
	set -x GDK_DPI_SCALE 0.5
	set -x QT_AUTO_SCREEN_SET_FACTOR 0
	set -x QT_SCALE_FACTOR 2
	set -x QT_FONT_DPI 96
end
