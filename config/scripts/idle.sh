#!/bin/sh

swayidle -w \
  timeout 180 ~/.config/scripts/lock.sh \
  timeout 200 "hyprctl dispatcher dpms off" \
  resume "hyprctl dispatcher dpms on" \
  before-sleep ~/.config/scripts/lock.sh
