-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.font =  wezterm.font('JetBrains Mono')
-- Use this for a zero with a line through it rather than a dot
-- when using the Fira Code font
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true
config.font_size = 19.5
-- config.line_height = 1.2
config.cell_width = 0.9
config.color_scheme = 'Helios (base16)'
config.default_cursor_style = 'BlinkingBlock'
config.custom_block_glyphs = true

config.colors = {
--	    foreground = "#bcc2be",
--	    background = "#16191c"
}
return config
