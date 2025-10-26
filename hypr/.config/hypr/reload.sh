#!/bin/bash

# Reload script for Hyprland, Hyprpaper, and Waybar
# This script gracefully reloads all components of the Hyprland desktop environment

set -e  # Exit on any error

echo "🔄 Reloading Hyprland desktop environment..."

# Function to check if a process is running
is_running() {
    pgrep -x "$1" > /dev/null 2>&1
}

# Function to kill process gracefully
kill_process() {
    local process_name="$1"
    if is_running "$process_name"; then
        echo "  📤 Stopping $process_name..."
        killall "$process_name" 2>/dev/null || true
        # Wait a moment for graceful shutdown
        sleep 0.5
    fi
}

# Function to start process
start_process() {
    local process_name="$1"
    local command="$2"
    echo "  🚀 Starting $process_name..."
    eval "$command" &
    sleep 0.2  # Brief pause between starts
}

# Reload Hyprland configuration
echo "  🔧 Reloading Hyprland configuration..."
hyprctl reload

# Restart Waybar
kill_process "waybar"
echo "  🚀 Starting waybar..."
hyprctl dispatch exec "waybar --config ~/dotfiles/waybar/.config/waybar/config.jsonc --style ~/dotfiles/waybar/.config/waybar/style.css"
sleep 0.2

# Restart Hyprpaper
kill_process "hyprpaper"
start_process "hyprpaper" "hyprpaper"

echo "✅ Desktop environment reloaded successfully!"
echo "   - Hyprland configuration reloaded"
echo "   - Waybar restarted"
echo "   - Hyprpaper restarted"
