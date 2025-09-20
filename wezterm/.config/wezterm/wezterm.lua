local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- load appearance module
for k, v in pairs(require("appearance")) do
  config[k] = v
end

-- load keybinds module
for k, v in pairs(require("keybinds")) do
  config[k] = v
end

-- Window behavior
config.initial_cols = 120
config.initial_rows = 30
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true

return config


