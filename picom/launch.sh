#!/bin/bash
if [ "$NO_VSYNC" -eq "1" ]; then
    picom --experimental-backends --no-vsync
else
    picom --experimental-backends
fi
