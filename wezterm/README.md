# WezTerm Configuration

This directory contains the WezTerm terminal emulator configuration with custom themes.

## Files

- `.config/wezterm/.wezterm.lua` - Main configuration file
- `.config/wezterm/colors/custom-dark.toml` - Custom dark theme
- `.config/wezterm/colors/custom-light.toml` - Custom light theme

## Features

### Custom Themes
- **Custom Dark**: A modern dark theme inspired by GitHub's color palette
- **Custom Light**: A clean light theme with good contrast

### Configuration Highlights
- Font: JetBrains Mono with fallbacks
- Window transparency with 95% opacity
- Fancy tab bar with custom styling
- Custom key bindings for better workflow
- Window padding for better readability
- Inactive pane dimming for focus indication

### Key Bindings
- `Ctrl+Shift+T`: Create new tab
- `Ctrl+Shift+W`: Close current tab
- `Ctrl+Shift+D`: Split horizontally
- `Ctrl+Shift+Shift+D`: Split vertically
- `Option+Left/Right`: Word navigation

## Installation

To use this configuration, create a symlink to your home directory:

```bash
ln -s /home/markus/dotfiles/wezterm/.config/wezterm ~/.config/wezterm
```

Or copy the files to your WezTerm config directory:

```bash
cp -r /home/markus/dotfiles/wezterm/.config/wezterm ~/.config/
```

## Customization

### Changing Themes
Edit the `color_scheme` setting in `.wezterm.lua`:
```lua
config.color_scheme = 'Custom Dark'  -- or 'Custom Light'
```

### Adding New Themes
1. Create a new `.toml` file in the `colors/` directory
2. Define your color scheme following the TOML format
3. Add the theme to the `color_schemes` table in `.wezterm.lua`

### Font Configuration
To change fonts, modify the `font` setting:
```lua
config.font = wezterm.font_with_fallback({
  'Your Font Name',
  'Fallback Font',
  'monospace',
})
```

## Color Palette

The custom themes use a carefully selected color palette:

### Dark Theme Colors
- Background: `#0d1117` (GitHub dark)
- Foreground: `#e6e6e6` (Light gray)
- Accent: `#58a6ff` (GitHub blue)
- Success: `#3fb950` (GitHub green)
- Warning: `#d29922` (GitHub yellow)
- Error: `#f85149` (GitHub red)

### Light Theme Colors
- Background: `#ffffff` (Pure white)
- Foreground: `#24292f` (Dark gray)
- Accent: `#0969da` (GitHub blue)
- Success: `#1a7f37` (GitHub green)
- Warning: `#9a6700` (GitHub yellow)
- Error: `#d1242f` (GitHub red)
