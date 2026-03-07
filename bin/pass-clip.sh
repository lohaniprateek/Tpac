#!/usr/bin/env bash

set -euo pipefail

CLIP_TIME=20
PASS_BIN=/usr/bin/pass
DMENU_BIN=/usr/bin/dmenu
XCLIP_BIN=/usr/bin/xclip

if command -v dunstify >/dev/null 2>&1; then
  NOTIFY_BIN="$(command -v dunstify)"
elif command -v notify-send >/dev/null 2>&1; then
  NOTIFY_BIN="$(command -v notify-send)"
else
  NOTIFY_BIN=""
fi

ENTRY="$("$PASS_BIN" ls --flat | "$DMENU_BIN" -i -p "Password:")"
[[ -z "$ENTRY" ]] && exit 0

# Copy password (first line only) to X11 clipboard.
"$PASS_BIN" show "$ENTRY" | head -n 1 | "$XCLIP_BIN" -selection clipboard

if [[ -n "$NOTIFY_BIN" ]]; then
  "$NOTIFY_BIN" "Password Copied" "Password for $ENTRY copied. Clears in $CLIP_TIME seconds."
fi

sleep "$CLIP_TIME"
printf '' | "$XCLIP_BIN" -selection clipboard

if [[ -n "$NOTIFY_BIN" ]]; then
  "$NOTIFY_BIN" "Clipboard Cleared" "Password for $ENTRY cleared."
fi
