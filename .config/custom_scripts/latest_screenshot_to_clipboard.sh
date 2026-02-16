#!/usr/bin/env bash
set -u -o pipefail
set -x

log() { printf '[clipshot] %s\n' "$*"; }

latest_file="$(
  find "$HOME/Desktop" -maxdepth 1 -type f \( \
    -name 'Screenshot*' -o -name 'Screen Shot*' -o -name '*.png' -o -name '*.jpg' -o -name '*.jpeg' \
  \) -print0 \
  | xargs -0 stat -f '%m %N' \
  | sort -nr \
  | head -n 1 \
  | cut -d' ' -f2-
)"

if [[ -z "${latest_file:-}" || ! -f "$latest_file" ]]; then
  log "No image found on Desktop"
  exit 1
fi

log "FILE: $latest_file"
file "$latest_file" || true

ext="${latest_file##*.}"
ext="$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')"
log "EXT: $ext"

# Try with explicit error capture
if [[ "$ext" == "png" ]]; then
  if ! err="$(osascript -e "set the clipboard to (read (POSIX file \"$latest_file\") as «class PNGf»)" 2>&1)"; then
    log "PNG copy failed: $err"
    exit 1
  fi
elif [[ "$ext" == "jpg" || "$ext" == "jpeg" ]]; then
  if ! err="$(osascript -e "set the clipboard to (read (POSIX file \"$latest_file\") as JPEG picture)" 2>&1)"; then
    log "JPEG copy failed: $err"
    exit 1
  fi
else
  if ! err="$(osascript -e "set the clipboard to (read (POSIX file \"$latest_file\") as «class PNGf»)" 2>&1)"; then
    log "Fallback copy failed: $err"
    exit 1
  fi
fi

log "Copied: $(basename "$latest_file")"
