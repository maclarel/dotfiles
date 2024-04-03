#!/bin/sh

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

VOLUME=$INFO

case $VOLUME in
#  [6-9][0-9]|100) ICON="墳"
#  ;;
#  [3-5][0-9]) ICON="奔"
#  ;;
#  [1-9]|[1-2][0-9]) ICON="奄"
#  ;;
  *) ICON="󰕾"
esac

sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
