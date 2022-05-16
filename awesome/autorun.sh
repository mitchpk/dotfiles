#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run ~/.fehbg
run picom --experimental-backends
run nvidia-settings -l
run redshift
run dex -a
