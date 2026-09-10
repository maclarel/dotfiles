#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"

# The wifi_change event supplies a $INFO variable in which the current SSID
# is passed to the script.

INFO=$(ipconfig getsummary "$(networksetup -listallhardwareports | awk '/Wi-Fi|AirPort/{getline; print $NF}')" | grep '  SSID : ' | awk -F ': ' '{print $2}')

if [ -n "$INFO" ]; then
  sketchybar --set "$NAME" label="$INFO" icon.color="$ICON_COLOR" label.color="$TEXT_COLOR"
else
  sketchybar --set "$NAME" label="Not Connected" icon.color="$MUTED_COLOR" label.color="$MUTED_COLOR"
fi
