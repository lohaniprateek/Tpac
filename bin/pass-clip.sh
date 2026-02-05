#!/usr/bin/env bash

CLIP_TIME=20

PASS_BIN=/usr/bin/pass
ROFI_BIN=/usr/bin/rofi
WLCOPY_BIN=/usr/bin/wl-copy
SWAYNC_BIN=/usr/bin/swaync-client

ENTRY=$("$PASS_BIN" ls --flat | "$ROFI_BIN" -dmenu -p "Password:")
[ -z "$ENTRY" ] && exit 0

# Copy password (first line only)
"$PASS_BIN" show "$ENTRY" | head -n 1 | "$WLCOPY_BIN"

# Notify copied
"$SWAYNC_BIN" -n \
  -t "Password Copied" \
  -b "Password for <b>$ENTRY</b> copied.
Clears in $CLIP_TIME seconds."

# Wait and clear clipboard
sleep "$CLIP_TIME"
"$WLCOPY_BIN" --clear

# Notify cleared
"$SWAYNC_BIN" -n \
  -t "Clipboard Cleared" \
  -b "Password for <b>$ENTRY</b> cleared."
