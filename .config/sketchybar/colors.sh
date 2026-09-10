#!/usr/bin/env bash
# Nord palette for SketchyBar (0xAARRGGBB)
# https://www.nordtheme.com/docs/colors-and-palettes

# Polar Night
export NORD0=0xff2e3440
export NORD1=0xff3b4252
export NORD2=0xff434c5e
export NORD3=0xff4c566a

# Snow Storm
export NORD4=0xffd8dee9
export NORD5=0xffe5e9f0
export NORD6=0xffeceff4

# Frost
export NORD7=0xff8fbcbb
export NORD8=0xff88c0d0
export NORD9=0xff81a1c1
export NORD10=0xff5e81ac

# Aurora
export NORD11=0xffbf616a # red
export NORD12=0xffd08770 # orange
export NORD13=0xffebcb8b # yellow
export NORD14=0xffa3be8c # green
export NORD15=0xffb48ead # purple

# Semantic aliases
export BAR_COLOR=$NORD0
export TEXT_COLOR=$NORD4
export ICON_COLOR=$NORD8
export MUTED_COLOR=$NORD3
export SEPARATOR_COLOR=$NORD3

export WORKSPACE_BG=$NORD1
export WORKSPACE_BG_FOCUSED=$NORD2
export WORKSPACE_LABEL_FOCUSED=$NORD8

export STATUS_OK=$NORD14
export STATUS_WARN=$NORD13
export STATUS_ERROR=$NORD11
