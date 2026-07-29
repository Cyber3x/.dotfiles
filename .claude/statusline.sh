#!/usr/bin/env bash
# Claude Code status line: dir | branch | model | context | time | next reset
set -euo pipefail

input="$(cat)"

dir="$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // ""')"
model="$(printf '%s' "$input" | jq -r '.model.display_name // "?"' | awk '{print $1}')"

# Directory (basename)
dir_name="$(basename "$dir" 2>/dev/null || echo "$dir")"

# Git branch + working-tree diff stats vs HEAD
branch=""
if [ -n "$dir" ] && git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch="$(git -C "$dir" branch --show-current 2>/dev/null)"
  [ -z "$branch" ] && branch="$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)"

  read -r added removed <<EOF
$(git -C "$dir" diff --numstat HEAD 2>/dev/null | awk '
  $1 ~ /^[0-9]+$/ { a += $1 }
  $2 ~ /^[0-9]+$/ { r += $2 }
  END { printf "%d %d", a, r }')
EOF
  if [ "${added:-0}" -gt 0 ] || [ "${removed:-0}" -gt 0 ]; then
    branch="${branch} (+${added:-0}, -${removed:-0})"
  fi
fi

# Context: use the native context_window block from the payload
ctx=""
read -r used_tokens used_pct <<EOF
$(printf '%s' "$input" | jq -r '
  (.context_window // {}) as $c
  | ($c.current_usage // {}) as $u
  | (($u.input_tokens // 0)
     + ($u.cache_read_input_tokens // 0)
     + ($u.cache_creation_input_tokens // 0)) as $t
  | "\($t) \($c.used_percentage // 0)"')
EOF
if [ "${used_tokens:-0}" -gt 0 ] 2>/dev/null; then
  if [ "$used_tokens" -ge 1000 ]; then
    ctx="$(awk -v t="$used_tokens" 'BEGIN{printf "%.0fk", t/1000}')"
  else
    ctx="$used_tokens"
  fi
  ctx="${ctx} (${used_pct}%)"
fi

# 5-hour rolling usage window (the short-term "hourly" quota)
usage_pct="$(printf '%s' "$input" | jq -r '(.rate_limits.five_hour.used_percentage) // empty | if type == "number" then floor else . end')"

# Next rate-limit reset: soonest resets_at across all windows
reset=""
reset_ts="$(printf '%s' "$input" | jq -r '
  [ (.rate_limits // {}) | to_entries[] | .value.resets_at // empty ]
  | map(select(. > 0)) | min // empty')"
if [ -n "$reset_ts" ]; then
  reset="$(date -d "@$reset_ts" +%H:%M 2>/dev/null || true)"
fi

# Assemble (colored emoji icons)
parts="📁 ${dir_name}"
[ -n "$branch" ] && parts="${parts} | 🌿 ${branch}"
parts="${parts} | 🤖 ${model}"
[ -n "$ctx" ] && parts="${parts} | 🧠 ${ctx}"
if [ -n "$reset" ]; then
  if [ -n "$usage_pct" ]; then
    parts="${parts} | ⏰ ${reset} (${usage_pct}%)"
  else
    parts="${parts} | ⏰ ${reset}"
  fi
fi

printf '%s' "$parts"
