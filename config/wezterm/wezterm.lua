local wezterm = require 'wezterm'

local config = wezterm.config_builder()
config.bold_brightens_ansi_colors = false
config.color_scheme = 'Gruvbox Dark (Gogh)'
config.font = wezterm.font 'Iosevka Term Extended'
config.font_size = 12.75
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.freetype_load_target = 'HorizontalLcd'
config.font_rules = {
    {
        intensity = "Bold",
        italic = false,
        font = wezterm.font("Iosevka Term Extended", { weight = "Bold", stretch = "Normal", style = "Normal" }),
    },
    {
        intensity = "Bold",
        italic = true,
        font = wezterm.font("Iosevka Term Extended", { weight = "Bold", stretch = "Normal", style = "Italic" }),
    },
}
config.max_fps = 255
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.enable_scroll_bar = false
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}

return config
