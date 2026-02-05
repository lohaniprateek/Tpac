#!/usr/bin/env bash

export XDG_RUNTIME_DIR=/run/user/$(id -u)
export WAYLAND_DISPLAY=wayland-1

HOUR=$(date +%-H)
WALLDIR="$HOME/Tpac/wallpapers/earth"

if ((HOUR >= 0 && HOUR < 1)); then
<<<<<<< HEAD
  WALL="$WALLDIR/0.png"
elif ((HOUR >= 1 && HOUR < 2)); then
  WALL="$WALLDIR/1.png"
elif ((HOUR >= 2 && HOUR < 3)); then
  WALL="$WALLDIR/2.png"
elif ((HOUR >= 3 && HOUR < 4)); then
  WALL="$WALLDIR/3.png"
elif ((HOUR >= 4 && HOUR < 5)); then
  WALL="$WALLDIR/4.png"
elif ((HOUR >= 5 && HOUR < 6)); then
  WALL="$WALLDIR/5.png"
elif ((HOUR >= 6 && HOUR < 7)); then
  WALL="$WALLDIR/6.png"
elif ((HOUR >= 7 && HOUR < 8)); then
  WALL="$WALLDIR/7.png"
elif ((HOUR >= 8 && HOUR < 9)); then
  WALL="$WALLDIR/8.png"
elif ((HOUR >= 9 && HOUR < 10)); then
  WALL="$WALLDIR/9.png"
elif ((HOUR >= 10 && HOUR < 11)); then
  WALL="$WALLDIR/10.png"
elif ((HOUR >= 11 && HOUR < 12)); then
  WALL="$WALLDIR/11.png"
elif ((HOUR >= 12 && HOUR < 13)); then
  WALL="$WALLDIR/12.png"
elif ((HOUR >= 13 && HOUR < 14)); then
  WALL="$WALLDIR/13.png"
elif ((HOUR >= 14 && HOUR < 15)); then
  WALL="$WALLDIR/14.png"
elif ((HOUR >= 15 && HOUR < 16)); then
  WALL="$WALLDIR/15.png"
elif ((HOUR >= 16 && HOUR < 17)); then
  WALL="$WALLDIR/16.png"
elif ((HOUR >= 17 && HOUR < 18)); then
  WALL="$WALLDIR/17.png"
elif ((HOUR >= 18 && HOUR < 19)); then
  WALL="$WALLDIR/18.png"
elif ((HOUR >= 19 && HOUR < 20)); then
  WALL="$WALLDIR/19.png"
elif ((HOUR >= 20 && HOUR < 21)); then
  WALL="$WALLDIR/20.png"
elif ((HOUR >= 21 && HOUR < 22)); then
  WALL="$WALLDIR/21.png"
elif ((HOUR >= 22 && HOUR < 23)); then
  WALL="$WALLDIR/22.png"
else
  WALL="$WALLDIR/23.png"
=======
  WALL="$WALLDIR/0.jpg"
elif ((HOUR >= 1 && HOUR < 2)); then
  WALL="$WALLDIR/1.jpg"
elif ((HOUR >= 2 && HOUR < 3)); then
  WALL="$WALLDIR/2.jpg"
elif ((HOUR >= 3 && HOUR < 4)); then
  WALL="$WALLDIR/3.jpg"
elif ((HOUR >= 4 && HOUR < 5)); then
  WALL="$WALLDIR/4.jpg"
elif ((HOUR >= 5 && HOUR < 6)); then
  WALL="$WALLDIR/5.jpg"
elif ((HOUR >= 6 && HOUR < 7)); then
  WALL="$WALLDIR/6.jpg"
elif ((HOUR >= 7 && HOUR < 8)); then
  WALL="$WALLDIR/7.jpg"
elif ((HOUR >= 8 && HOUR < 9)); then
  WALL="$WALLDIR/8.jpg"
elif ((HOUR >= 9 && HOUR < 10)); then
  WALL="$WALLDIR/9.jpg"
elif ((HOUR >= 10 && HOUR < 11)); then
  WALL="$WALLDIR/10.jpg"
elif ((HOUR >= 11 && HOUR < 12)); then
  WALL="$WALLDIR/11.jpg"
elif ((HOUR >= 12 && HOUR < 13)); then
  WALL="$WALLDIR/12.jpg"
elif ((HOUR >= 13 && HOUR < 14)); then
  WALL="$WALLDIR/13.jpg"
elif ((HOUR >= 14 && HOUR < 15)); then
  WALL="$WALLDIR/14.jpg"
elif ((HOUR >= 15 && HOUR < 16)); then
  WALL="$WALLDIR/15.jpg"
elif ((HOUR >= 16 && HOUR < 17)); then
  WALL="$WALLDIR/16.jpg"
elif ((HOUR >= 17 && HOUR < 18)); then
  WALL="$WALLDIR/17.jpg"
elif ((HOUR >= 18 && HOUR < 19)); then
  WALL="$WALLDIR/18.jpg"
elif ((HOUR >= 19 && HOUR < 20)); then
  WALL="$WALLDIR/19.jpg"
elif ((HOUR >= 20 && HOUR < 21)); then
  WALL="$WALLDIR/20.jpg"
elif ((HOUR >= 21 && HOUR < 22)); then
  WALL="$WALLDIR/21.jpg"
elif ((HOUR >= 22 && HOUR < 23)); then
  WALL="$WALLDIR/22.jpg"
else
  WALL="$WALLDIR/23.jpg"
>>>>>>> main
fi

swww img "$WALL" \
  --transition-type wipe \
  --transition-duration 3 \
  --transition-fps 60
