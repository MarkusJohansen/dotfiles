local wezterm = require 'wezterm'
local config  = wezterm.config_builder()
local act     = wezterm.action

-- Make sure Lua can see files in this directory
package.path = package.path .. ";" .. wezterm.config_dir .. "/?.lua"

-- load appearance safely
local okA, appearance = pcall(require, "appearance")
if okA and type(appearance) == "table" then
  for k,v in pairs(appearance) do config[k] = v end
else
  wezterm.log_info("appearance.lua not loaded: "..tostring(appearance))
end

-- load keybinds safely  <-- CHANGED
local okK, keybinds = pcall(require, "keybinds")
if okK and type(keybinds) == "table" then
  for k,v in pairs(keybinds) do config[k] = v end
else
  wezterm.log_info("keybinds.lua not loaded: "..tostring(keybinds))
end

-- Window behavior
config.initial_cols = 120
config.initial_rows = 30
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.enable_wayland = true

return config

