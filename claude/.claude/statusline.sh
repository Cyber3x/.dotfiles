#!/usr/bin/env bash
# Claude Code status line: dir | branch | model | context | time | next reset
set -euo pipefail

IFS=$'\x1f' read -r dir model used_tokens used_pct usage_pct reset_ts <<EOF2
$(jq -r '
  (.context_window // {}) as $c
  | ($c.current_usage // {}) as $u
  | [
      (.workspace.current_dir // .cwd // ""),
      (.model.display_name // "?"),
      (($u.input_tokens // 0) + ($u.cache_read_input_tokens // 0) + ($u.cache_creation_input_tokens // 0)),
      ($c.used_percentage // 0),
      ((.rate_limits.five_hour.used_percentage // "-") | if type == "number" then floor else . end),
      ([(.rate_limits // {}) | to_entries[] | .value.resets_at // empty | select(. > 0)] | min // "-")
    ] | join("\u001f")')
EOF2

# Git branch + working-tree diff stats vs HEAD
branch=""
if [ -n "$dir" ] && git -C "$dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch="$(git -C "$dir" branch --show-current 2>/dev/null)"
  [ -z "$branch" ] && branch="$(git -C "$dir" rev-parse --short HEAD 2>/dev/null)"
  read -r added removed <<EOF2
$(git -C "$dir" diff --numstat HEAD 2>/dev/null | awk '{ a += $1; r += $2 } END { printf "%d %d", a, r }')
EOF2
  [ "$added" -gt 0 ] || [ "$removed" -gt 0 ] && branch="${branch} (+${added}, -${removed})"
fi

ctx=""
if [ "$used_tokens" -gt 0 ]; then
  [ "$used_tokens" -ge 1000 ] && ctx="$(awk -v t="$used_tokens" 'BEGIN{printf "%.0fk", t/1000}')" || ctx="$used_tokens"
  ctx="${ctx} (${used_pct}%)"
fi

parts="📁 $(basename "$dir")"
[ -n "$branch" ] && parts="${parts} | 🌿 ${branch}"
parts="${parts} | 🤖 ${model}"
[ -n "$ctx" ] && parts="${parts} | 🧠 ${ctx}"
if [ "$reset_ts" != "-" ]; then
  parts="${parts} | ⏰ $(date -d "@$reset_ts" +%H:%M)"
  [ "$usage_pct" != "-" ] && parts="${parts} (${usage_pct}%)"
fi

printf '%s' "$parts"
