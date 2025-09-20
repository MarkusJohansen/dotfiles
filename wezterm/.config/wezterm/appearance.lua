-- Wezterm module appearance.lua
local wezterm = require("wezterm")

local M = {}

-- Appearance
M.color_scheme = "Arthur" -- pick a scheme you like
M.font = wezterm.font_with_fallback {
  "JetBrainsMono Nerd Font",
  "FiraCode Nerd Font",
}
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

