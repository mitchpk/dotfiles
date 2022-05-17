#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run xss-lock --transfer-sleep-lock -- i3lock -c 333333 --nofork
run picom --experimental-backends
run ~/.fehbg
run dex -a
run nvidia-settings -l
run redshift
