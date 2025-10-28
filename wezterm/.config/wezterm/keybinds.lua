-- Cross-platform keybinds for WezTerm
-- macOS: use SUPER (Cmd) for GUI actions
-- Windows/Linux: use ALT (lighter than CTRL|SHIFT)
-- Optional modal "pane mode" for single-key pane actions on any OS

local wezterm = require "wezterm"
local act = wezterm.action
local M = {}

local triple = wezterm.target_triple or ""
local is_darwin  = triple:find("darwin") ~= nil
local is_windows = triple:find("windows") ~= nil
-- local is_linux = (not is_darwin) and (not is_windows)

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
  -- Pane splits
  -- Vertical split: Cmd+\ (mac) or Alt+\ (Win/Linux)
  {
    key = "\\",
    mods = is_darwin and "SUPER" or "ALT",
    action = act.SplitVertical{ domain = "CurrentPaneDomain" },
  },
  -- Horizontal split: Cmd+- (mac) or Alt+- (Win/Linux)
  {
    key = "-",
    mods = is_darwin and "SUPER" or "ALT",
    action = act.SplitHorizontal{ domain = "CurrentPaneDomain" },
  },

  -- Close current pane (confirm)
  {
    key = "w",
    mods = is_darwin and "SUPER" or "ALT",
    action = act.CloseCurrentPane{ confirm = true },
  },
}

-- Platform-specific GUI clipboard bindings
local platform_gui = {}
if is_darwin then
  -- macOS: standard Cmd+C/V/A
  platform_gui = {
    { key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
    { key = "a", mods = "SUPER", action = select_all_copy_actions() },
  }
else
  -- Windows/Linux: use ALT instead of CTRL|SHIFT
  -- (keeps Ctrl+C free for SIGINT; feels lighter than Ctrl+Shift)
  platform_gui = {
    { key = "c", mods = "ALT", action = act.CopyTo("Clipboard") },
    { key = "v", mods = "ALT", action = act.PasteFrom("Clipboard") },
    { key = "a", mods = "ALT", action = select_all_copy_actions() },
  }
end

-- Optional: true single-key actions via a modal "pane" table
-- Press F9 to enter pane mode, then:
--   v = vertical split, s = horizontal split, x = close, q = exit mode
M.key_tables = {
  pane = {
    { key = "v", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
    { key = "s", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
    { key = "x", action = act.CloseCurrentPane{ confirm = true } },
    { key = "q", action = "PopKeyTable" },
  },
}

M.keys = {}

-- Enter modal pane mode with a single key (F9)
table.insert(M.keys, {
  key = "F9",
  action = act.ActivateKeyTable{
    name = "pane",
    one_shot = false,
    timeout_milliseconds = 3000, -- auto-exit after 3s of inactivity
  }
})

-- (Optional) single-key clipboard on Windows via function keys (safe)
-- Uncomment if you want true single-key copy/paste without modifiers:
-- if is_windows then
--   table.insert(M.keys, { key = "F5", action = act.CopyTo("Clipboard") })
--   table.insert(M.keys, { key = "F6", action = act.PasteFrom("Clipboard") })
--   table.insert(M.keys, { key = "F7", action = select_all_copy_actions() })
-- end

-- Merge platform + common
for _, k in ipairs(platform_gui) do table.insert(M.keys, k) end
for _, k in ipairs(common) do table.insert(M.keys, k) end

return M

