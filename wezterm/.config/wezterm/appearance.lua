-- Wezterm module appearance.lua
local wezterm = require("wezterm")

local M = {}

-- Appearance
--M.color_scheme = "BirdsOfParadise"
M.color_scheme = 'Dawn (terminal.sexy)'
--M.color_scheme = 'Earthsong'
M.font_size = 13
M.window_background_opacity = 0.85
M.window_padding = {
  left = 8,
  right = 8,
  top = 6,
  bottom = 6,
}
M.tab_bar_at_bottom = true
M.use_fancy_tab_bar = false

return M

