#!/usr/bin/env bash
# Installs the Tweed Alacritty colour scheme into ~/.config/alacritty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/alacritty/themes
mkdir -p "$dest"
[ -f "$dest/tweed.toml" ] && cp "$dest/tweed.toml" "$dest/tweed.toml.bak"
cp "$dir/tweed.toml" "$dest/"
echo "Done. Add to ~/.config/alacritty/alacritty.toml:"
echo '  [general]'
echo '  import = ["~/.config/alacritty/themes/tweed.toml"]'
