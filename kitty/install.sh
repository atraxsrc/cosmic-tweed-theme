#!/usr/bin/env bash
# Installs the Tweed kitty colour scheme into ~/.config/kitty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/kitty/themes
mkdir -p "$dest"
[ -f "$dest/Tweed.conf" ] && cp "$dest/Tweed.conf" "$dest/Tweed.conf.bak"
cp "$dir/Tweed.conf" "$dest/"
echo "Done. Add to ~/.config/kitty/kitty.conf:  include themes/Tweed.conf"
echo "then reload kitty (Ctrl+Shift+F5)."
