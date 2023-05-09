#!/bin/sh
(
    flock -x -w 10 200 || exit 1
    echo $(checkupdates | wc -l)
) 200>/tmp/updates.lck
