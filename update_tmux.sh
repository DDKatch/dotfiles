#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${1:-$HOME/tmux-logs}"
mkdir -p "$LOG_DIR"

sanitize() {
  printf '%s' "$1" | sed 's/[^[:alnum:]._-]/_/g'
}

tmux list-panes -a -F '#{pane_id}|#{session_name}|#{window_index}|#{pane_index}' \
| while IFS='|' read -r pane_id session_name window_index pane_index; do
    s_session="$(sanitize "$session_name")"
    s_window="$(sanitize "$window_index")"
    s_pane="$(sanitize "$pane_index")"
    s_pane_id="$(sanitize "$pane_id")"

    logfile="$LOG_DIR/${s_session}_${s_window}_${s_pane}_${s_pane_id}.log"

    tmux pipe-pane -t "$pane_id"                       # close old pipe if any
    tmux pipe-pane -t "$pane_id" "cat >> '$logfile'"  # open new one

    echo "$pane_id -> $logfile"
  done
