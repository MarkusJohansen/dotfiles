local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Appearance
config.color_scheme = "Arthur" -- pick a scheme you like
config.font = wezterm.font_with_fallback {
  "JetBrainsMono Nerd Font",
  "FiraCode Nerd Font",
}
config.font_size = 13
config.window_background_opacity = 0.85
config.window_padding = {
	left=8,
	right=8,
	top=6,
	bottom=6,
}
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Window behavior
config.initial_cols = 120
config.initial_rows = 30
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

-- Wayland tweaks
config.enable_wayland = true

-- Key bindings: override default copy/paste
config.keys = {
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

return config


