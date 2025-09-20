-- Keybinds
local wezterm = require "wezterm"
local act = wezterm.action
local M = {}

M.keys = {
  -- CTRL+c → Copy
  {
    key = "c",
    mods = "CTRL",
    action = act.CopyTo "Clipboard",
  },
  -- CTRL+v → Paste
  {
    key = "v",
    mods = "CTRL",
    action = act.PasteFrom "Clipboard",
  },
  -- ALT+A select all
  {
    key = "a",
    mods = "CTRL",
    action = act.Multiple{
      act.ActivateCopyMode,
      act.CopyMode("MoveToScrollbackTop"),
      act.CopyMode({ SetSelectionMode = "Cell" }),
      act.CopyMode("MoveToScrollbackBottom"),
      act.CopyTo("Clipboard"),
      act.ClearSelection,
      act.CopyMode("Close"),
    },
  },
  -- CTRL++ horizontal split
  {
     key="+",
     mods="CTRL",
     action=act{
             SplitHorizontal={
                     domain="CurrentPaneDomain"
             }
     }
  },
  -- ALT+\ Vertical split
  {
     key="\\",
     mods="CTRL",
     action=act{
             SplitVertical={
                     domain="CurrentPaneDomain"
             }
     }
  },
  -- ALT+W close current tab
  {
    key = "w",
    mods = "CTRL",
    action = act.CloseCurrentPane { confirm = true },
  },
}

return M
