#!/usr/bin/env bash
# Installs the Tweed Ghostty theme into ~/.config/ghostty/themes/
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/ghostty/themes
mkdir -p "$dest"
[ -f "$dest/Tweed" ] && cp "$dest/Tweed" "$dest/Tweed.bak"
cp "$dir/Tweed" "$dest/"
echo "Done. Add to ~/.config/ghostty/config:  theme = Tweed"
echo "(or  theme = dark:Tweed,light:TweedDay  to follow COSMIC's toggle), then reload: Ctrl+Shift+,"
