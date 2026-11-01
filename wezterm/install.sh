#!/usr/bin/env bash
# Installs the Tweed WezTerm colour module into ~/.config/wezterm/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/wezterm
mkdir -p "$dest"
[ -f "$dest/tweed.lua" ] && cp "$dest/tweed.lua" "$dest/tweed.lua.bak"
cp "$dir/tweed.lua" "$dest/"
echo 'Done. Add to ~/.config/wezterm/wezterm.lua:  config.colors = require("tweed")'
