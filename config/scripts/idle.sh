#!/bin/sh

swayidle -w \
  timeout 300 ~/.config/scripts/lock.sh \
  timeout 360 "hyprctl dispatcher dpms off" \
  resume "hyprctl dispatcher dpms on" \
  before-sleep ~/.config/scripts/lock.sh
