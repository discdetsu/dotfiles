local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.initial_cols = 145 
config.initial_rows = 30

config.font = wezterm.font("ZedMono NF")
config.font_size = 16
config.color_scheme = 'Everblush (Gogh)'
config.enable_tab_bar = false
--config.window_decorations = "RESIZE"
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.9
return config
