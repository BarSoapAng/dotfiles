#!/usr/bin/env bash

autoload_nvmrc() {
  command -v nvm >/dev/null 2>&1 || return 0

  local nvmrc="$PWD/.nvmrc"
  [ -f "$nvmrc" ] || return 0

  local required current
  required="$(tr -d '[:space:]' < "$nvmrc")"
  current="$(nvm current)"

  if [ "$current" != "$required" ]; then
    nvm install "$required" >/dev/null
    nvm use "$required" >/dev/null
    echo "Switched Node to $(nvm current) (from $nvmrc)"
  fi
}