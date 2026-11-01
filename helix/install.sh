#!/usr/bin/env bash
# Installs the Tweed Helix theme into ~/.config/helix/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/helix/themes
mkdir -p "$dest"
[ -f "$dest/tweed.toml" ] && cp "$dest/tweed.toml" "$dest/tweed.toml.bak"
cp "$dir/tweed.toml" "$dest/"
echo 'Done. Add to ~/.config/helix/config.toml:  theme = "tweed"'
