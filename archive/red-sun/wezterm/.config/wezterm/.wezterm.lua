local wezterm = require 'wezterm'

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font configuration
config.font = wezterm.font_with_fallback({
  'JetBrains Mono',
  'Fira Code',
  'Cascadia Code',
  'monospace',
})

config.font_size = 12.0
config.line_height = 1.1

-- Window configuration
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.95
config.text_background_opacity = 0.9

-- Tab bar configuration
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.tab_max_width = 32

-- Window frame styling
config.window_frame = {
  font = wezterm.font { family = 'JetBrains Mono', weight = 'Bold' },
  font_size = 12.0,
  active_titlebar_bg = '#1a1a1a',
  inactive_titlebar_bg = '#1a1a1a',
}

-- Use our custom color scheme
config.color_scheme = 'Custom Dark'

-- Define our custom color schemes
config.color_schemes = {
  ['Custom Dark'] = {
    -- Basic colors
    foreground = '#e6e6e6',
    background = '#0d1117',
    
    -- Cursor colors
    cursor_bg = '#58a6ff',
    cursor_fg = '#0d1117',
    cursor_border = '#58a6ff',
    
    -- Selection colors
    selection_fg = '#0d1117',
    selection_bg = '#58a6ff',
    
    -- Scrollbar
    scrollbar_thumb = '#21262d',
    
    -- Split lines
    split = '#21262d',
    
    -- ANSI colors
    ansi = {
      '#484f58',  -- black
      '#f85149',  -- red
      '#3fb950',  -- green
      '#d29922',  -- yellow
      '#58a6ff',  -- blue
      '#bc8cff',  -- magenta
      '#39d353',  -- cyan
      '#b1bac4',  -- white
    },
    
    -- Bright ANSI colors
    brights = {
      '#6e7681',  -- bright black
      '#ff7b72',  -- bright red
      '#56d364',  -- bright green
      '#e3b341',  -- bright yellow
      '#79c0ff',  -- bright blue
      '#d2a8ff',  -- bright magenta
      '#56d364',  -- bright cyan
      '#f0f6fc',  -- bright white
    },
    
    -- Tab bar colors
    tab_bar = {
      background = '#0d1117',
      active_tab = {
        bg_color = '#21262d',
        fg_color = '#f0f6fc',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#0d1117',
        fg_color = '#7d8590',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab_hover = {
        bg_color = '#21262d',
        fg_color = '#b1bac4',
        italic = true,
      },
      new_tab = {
        bg_color = '#0d1117',
        fg_color = '#7d8590',
      },
      new_tab_hover = {
        bg_color = '#21262d',
        fg_color = '#b1bac4',
        italic = true,
      },
    },
    
    -- Copy mode colors
    copy_mode_active_highlight_bg = { Color = '#58a6ff' },
    copy_mode_active_highlight_fg = { Color = '#0d1117' },
    copy_mode_inactive_highlight_bg = { Color = '#21262d' },
    copy_mode_inactive_highlight_fg = { Color = '#b1bac4' },
    
    -- Quick select colors
    quick_select_label_bg = { Color = '#58a6ff' },
    quick_select_label_fg = { Color = '#0d1117' },
    quick_select_match_bg = { Color = '#21262d' },
    quick_select_match_fg = { Color = '#f0f6fc' },
  },
  
  ['Custom Light'] = {
    -- Basic colors
    foreground = '#24292f',
    background = '#ffffff',
    
    -- Cursor colors
    cursor_bg = '#0969da',
    cursor_fg = '#ffffff',
    cursor_border = '#0969da',
    
    -- Selection colors
    selection_fg = '#ffffff',
    selection_bg = '#0969da',
    
    -- Scrollbar
    scrollbar_thumb = '#d0d7de',
    
    -- Split lines
    split = '#d0d7de',
    
    -- ANSI colors
    ansi = {
      '#484f58',  -- black
      '#d1242f',  -- red
      '#1a7f37',  -- green
      '#9a6700',  -- yellow
      '#0969da',  -- blue
      '#8250df',  -- magenta
      '#1f883d',  -- cyan
      '#656d76',  -- white
    },
    
    -- Bright ANSI colors
    brights = {
      '#6e7681',  -- bright black
      '#da3633',  -- bright red
      '#238636',  -- bright green
      '#bf8700',  -- bright yellow
      '#218bff',  -- bright blue
      '#a475f9',  -- bright magenta
      '#2ea043',  -- bright cyan
      '#24292f',  -- bright white
    },
    
    -- Tab bar colors
    tab_bar = {
      background = '#ffffff',
      active_tab = {
        bg_color = '#f6f8fa',
        fg_color = '#24292f',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#ffffff',
        fg_color = '#656d76',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab_hover = {
        bg_color = '#f6f8fa',
        fg_color = '#24292f',
        italic = true,
      },
      new_tab = {
        bg_color = '#ffffff',
        fg_color = '#656d76',
      },
      new_tab_hover = {
        bg_color = '#f6f8fa',
        fg_color = '#24292f',
        italic = true,
      },
    },
    
    -- Copy mode colors
    copy_mode_active_highlight_bg = { Color = '#0969da' },
    copy_mode_active_highlight_fg = { Color = '#ffffff' },
    copy_mode_inactive_highlight_bg = { Color = '#f6f8fa' },
    copy_mode_inactive_highlight_fg = { Color = '#24292f' },
    
    -- Quick select colors
    quick_select_label_bg = { Color = '#0969da' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { Color = '#f6f8fa' },
    quick_select_match_fg = { Color = '#24292f' },
  },
}

-- Key bindings
config.keys = {
  -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bb' },
  },
  -- Make Option-Right equivalent to Alt-f; forward-word
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action { SendString = '\x1bf' },
  },
  -- Create new tab
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action { SpawnTab = 'CurrentPaneDomain' },
  },
  -- Close tab
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action { CloseCurrentTab = { confirm = true } },
  },
  -- Split horizontally
  {
    key = 'd',
    mods = 'CTRL|SHIFT',
    action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } },
  },
  -- Split vertically
  {
    key = 'D',
    mods = 'CTRL|SHIFT',
    action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } },
  },
}

-- Window padding
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- Inactive pane styling
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

-- Enable CSI u mode for better terminal compatibility
config.enable_csi_u_key_encoding = true

-- Disable ligatures for better compatibility
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

return config
