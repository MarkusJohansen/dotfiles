#!/bin/bash
# Enable mirror mode - mirrors laptop screen to external monitor

echo "🔄 Enabling mirror mode..."

# Configure monitors for mirroring (eDP-1 mirrors DP-1)
hyprctl keyword monitor "DP-1,2560x1440@60,0x0,1"
hyprctl keyword monitor "eDP-1,preferred,auto,1,mirror,DP-1"

# Restart waybar to fix rendering
killall waybar 2>/dev/null
sleep 0.5
hyprctl dispatch exec "waybar --config ~/dotfiles/waybar/.config/waybar/config.jsonc --style ~/dotfiles/waybar/.config/waybar/style.css"

echo "✅ Mirror mode enabled!"
echo "   Both screens should now show the same content"

