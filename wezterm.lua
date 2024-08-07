-- Pull in the wezterm API
local wezterm = require 'wezterm'
-- This table will hold the configuration.
local config = {}
-- Set the font
config.font = wezterm.font("JetBrains Mono")
-- Set front end and Wayland support
config.front_end = "OpenGL"
config.enable_wayland = false
-- Adjust tab bar visibility and mouse cursor behavior
config.hide_tab_bar_if_only_one_tab = true
config.hide_mouse_cursor_when_typing = true
-- Set font size and other visual settings
config.font_size = 18.0
--config.line_height = 1.2
--config.cell_width = 0.9
-- Set cursor style and custom block glyphs
config.default_cursor_style = 'BlinkingBlock'
config.cursor_thickness = '10%'
config.custom_block_glyphs = true
-- Enable HarfBuzz for advanced text shaping
-- Enable ligatures for improved readability
config.harfbuzz_features = {'zero'}
-- color scheme
--config.color_scheme = 'PaperColor Dark (base16)'
config.color_scheme = 'Material (terminal.sexy)'
config.freetype_load_flags = "DEFAULT"
config.font_shaper = "Harfbuzz"
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.colors  = {
        background = "#1c211f",
        foreground = "#ffffff"
}
-- Return the configuratiion
return config
