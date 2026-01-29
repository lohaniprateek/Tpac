#!/usr/bin/env bash

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export WAYLAND_DISPLAY=wayland-1

HOUR=$(date +%-H)
WALLDIR="$HOME/Tpac/wallpapers/time"

if ((HOUR >= 0 && HOUR < 4)); then
  WALL="$WALLDIR/0.png"
elif ((HOUR >= 4 && HOUR < 6)); then
  WALL="$WALLDIR/1.png"
elif ((HOUR >= 6 && HOUR < 8)); then
  WALL="$WALLDIR/2.png"
elif ((HOUR >= 8 && HOUR < 12)); then
  WALL="$WALLDIR/3.png"
elif ((HOUR >= 12 && HOUR < 15)); then
  WALL="$WALLDIR/4.png"
elif ((HOUR >= 15 && HOUR < 17)); then
  WALL="$WALLDIR/5.png"
elif ((HOUR >= 17 && HOUR < 18)); then
  WALL="$WALLDIR/6.png"
elif ((HOUR >= 18 && HOUR < 19)); then
  WALL="$WALLDIR/7.png"
elif ((HOUR >= 19 && HOUR < 20)); then
  WALL="$WALLDIR/8.png"
else
  WALL="$WALLDIR/9.png"
fi

swww img "$WALL" \
  --transition-type wipe \
  --transition-duration 3 \
  --transition-fps 60
