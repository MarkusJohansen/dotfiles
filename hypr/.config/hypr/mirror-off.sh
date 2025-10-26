#!/bin/bash
# Disable mirror mode - use extended desktop

echo "🔄 Disabling mirror mode..."

# Reset to auto-detection for all monitors
hyprctl keyword monitor ",preferred,auto,1"

# Restart waybar to fix rendering
killall waybar 2>/dev/null
sleep 0.5
hyprctl dispatch exec "waybar --config ~/dotfiles/waybar/.config/waybar/config.jsonc --style ~/dotfiles/waybar/.config/waybar/style.css"

echo "✅ Mirror mode disabled!"
echo "   Monitors will use extended desktop mode"

