-- Cross-platform keybinds for WezTerm
-- macOS: use SUPER (Cmd) for GUI actions
-- Linux/Windows: use CTRL|SHIFT for GUI actions
-- Keep Ctrl+C free to send SIGINT

local wezterm = require "wezterm"
local act = wezterm.action
local M = {}

local is_darwin = string.find(wezterm.target_triple, "darwin") ~= nil

-- Helpers for "Select All → Copy" without stealing Ctrl+C
local function select_all_copy_actions()
  return act.Multiple({
    act.ActivateCopyMode,
    act.CopyMode("MoveToScrollbackTop"),
    act.CopyMode({ SetSelectionMode = "Cell" }),
    act.CopyMode("MoveToScrollbackBottom"),
    act.CopyTo("Clipboard"),
    act.ClearSelection,
    act.CopyMode("Close"),
  })
end

-- Common actions (same on all OSes)
local common = {
  -- Pane splits (choose symbols that exist on every layout)
  -- Vertical split: Ctrl+Alt+\ (Win/Linux) or Cmd+\ (macOS)
  {
    key = "\\",
    mods = is_darwin and "SUPER" or "CTRL|ALT",
    action = act.SplitVertical{ domain = "CurrentPaneDomain" },
  },
  -- Horizontal split: Ctrl+Alt+- (Win/Linux) or Cmd+- (macOS)
  {
    key = "-",
    mods = is_darwin and "SUPER" or "CTRL|ALT",
    action = act.SplitHorizontal{ domain = "CurrentPaneDomain" },
  },

  -- Close current pane (confirm)
  {
    key = "w",
    mods = is_darwin and "SUPER" or "CTRL|SHIFT",
    action = act.CloseCurrentPane{ confirm = true },
  },
}

-- Platform-specific GUI bindings
local platform_gui = {}

if is_darwin then
  -- macOS: standard Cmd+C/V/A
  platform_gui = {
    { key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
    { key = "a", mods = "SUPER", action = select_all_copy_actions() },
  }
else
  -- Linux/Windows: Ctrl+Shift+C/V/A (keeps Ctrl+C for SIGINT)
  platform_gui = {
    { key = "c", mods = "CTRL|SHIFT", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },
    { key = "a", mods = "CTRL|SHIFT", action = select_all_copy_actions() },
  }
end

M.keys = {}
for _, k in ipairs(platform_gui) do table.insert(M.keys, k) end
for _, k in ipairs(common) do table.insert(M.keys, k) end

return M

