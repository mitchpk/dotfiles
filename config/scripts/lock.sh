#!/bin/sh

BG="282828"
BG2="3C3836"
RING="3EC07C"
TEXT="EBDBB2"
ACCENT="D65D0E"
RED="FB4934"
YELLOW="FABD2F"
GREEN="B8BB26"

swaylock \
  --clock \
  --indicator \
  --daemonize \
  --screenshots \
  --ignore-empty-password \
  --font "IosevkaTerm Nerd Font" \
  --indicator-radius 200 \
  --indicator-thickness 10 \
  --inside-color $BG \
  --inside-clear-color $BG \
  --inside-ver-color $BG \
  --inside-wrong-color $BG \
  --ring-color $RING \
  --ring-clear-color $YELLOW \
  --ring-ver-color $GREEN \
  --ring-wrong-color $RED \
  --line-color $BG2 \
  --line-clear-color $BG2 \
  --line-wrong-color $BG2 \
  --line-ver-color $BG2 \
  --separator-color $BG2 \
  --key-hl-color $ACCENT \
  --text-color $TEXT \
  --text-clear-color $TEXT \
  --text-ver-color $TEXT \
  --text-wrong-color $RED \
  --effect-blur 10x10 \
  --effect-vignette 0.5:0.5
