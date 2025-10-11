-- Wezterm module appearance.lua
local wezterm = require("wezterm")

local M = {}

-- Custom Color Schemes
M.color_schemes = {
  ['Red Sun'] = {
    -- Basic colors - Warm sunset theme
    foreground = '#f4e4bc',  -- Warm cream text
    background = '#18131a',  -- Dark purple-brown background (matches Waybar rgba(24, 19, 26, 0.5))
    
    -- Cursor colors - Orange sunset
    cursor_bg = '#ff6b35',  -- Bright orange-red
    cursor_fg = '#1a0f0a',  -- Dark background
    cursor_border = '#ff6b35',
    
    -- Selection colors - Warm orange
    selection_fg = '#1a0f0a',
    selection_bg = '#ff6b35',
    
    -- Scrollbar - Dark red-brown
    scrollbar_thumb = '#2d1b13',
    
    -- Split lines - Muted red-brown
    split = '#3d2a1f',
    
    -- ANSI colors - Orange and red palette
    ansi = {
      '#2d1b13',  -- black - dark red-brown
      '#ff4757',  -- red - bright red
      '#ff6b35',  -- green - orange-red (was green)
      '#ffa502',  -- yellow - golden orange
      '#ff8c42',  -- blue - deep orange (was blue)
      '#ff6b9d',  -- magenta - pink-red
      '#ff9f43',  -- cyan - warm orange (was cyan)
      '#f4e4bc',  -- white - warm cream
    },
    
    -- Bright ANSI colors - Brighter orange and red tones
    brights = {
      '#4a3429',  -- bright black - lighter red-brown
      '#ff6b7a',  -- bright red - softer red
      '#ff8c42',  -- bright green - bright orange (was green)
      '#ffb142',  -- bright yellow - golden yellow
      '#ffa726',  -- bright blue - amber orange (was blue)
      '#ff9ff3',  -- bright magenta - bright pink
      '#ffb74d',  -- bright cyan - light orange (was cyan)
      '#f8f4e6',  -- bright white - warm white
    },
    
    -- Tab bar colors - Sunset theme
    tab_bar = {
      background = '#18131a',
      active_tab = {
        bg_color = '#2d1b13',
        fg_color = '#f4e4bc',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#18131a',
        fg_color = '#8b7355',
        intensity = 'Normal',
        underline = 'None',
        italic = false,
        strikethrough = false,
      },
      inactive_tab_hover = {
        bg_color = '#2d1b13',
        fg_color = '#d4c4a8',
        italic = true,
      },
      new_tab = {
        bg_color = '#18131a',
        fg_color = '#8b7355',
      },
      new_tab_hover = {
        bg_color = '#2d1b13',
        fg_color = '#d4c4a8',
        italic = true,
      },
    },
    
    -- Copy mode colors - Orange highlights
    copy_mode_active_highlight_bg = { Color = '#ff6b35' },
    copy_mode_active_highlight_fg = { Color = '#1a0f0a' },
    copy_mode_inactive_highlight_bg = { Color = '#2d1b13' },
    copy_mode_inactive_highlight_fg = { Color = '#d4c4a8' },
    
    -- Quick select colors - Sunset theme
    quick_select_label_bg = { Color = '#ff6b35' },
    quick_select_label_fg = { Color = '#1a0f0a' },
    quick_select_match_bg = { Color = '#2d1b13' },
    quick_select_match_fg = { Color = '#f4e4bc' },
  },
}

-- Appearance
--M.color_scheme = "BirdsOfParadise"
--M.color_scheme = 'Dawn (terminal.sexy)'
--M.color_scheme = 'Earthsong'
M.color_scheme = 'Red Sun'
M.font_size = 13
M.window_background_opacity = 0.75
M.window_padding = {
  left = 8,
  right = 8,
  top = 6,
  bottom = 6,
}
M.tab_bar_at_bottom = true
M.use_fancy_tab_bar = false

return M

