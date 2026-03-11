#!/usr/bin/env bash

nvmup() {
  command -v nvm >/dev/null 2>&1 || return 0

  local nvmrc="$PWD/.nvmrc"
  [ -f "$nvmrc" ] || return 0

  local required current
  required="$(tr -d '[:space:]' < "$nvmrc")"
  current="$(nvm current)"

  if [ "$current" != "$required" ]; then
    if ! nvm list | grep -Eq "(^|[[:space:]])v?$required([[:space:]]|$)"; then
      nvm install "$required"
    fi

    nvm use "$required" >/dev/null
    echo "Using Node to $(nvm current)"
  fi
}
