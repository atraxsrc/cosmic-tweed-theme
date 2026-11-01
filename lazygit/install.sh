#!/usr/bin/env bash
# Installs the Tweed lazygit colours beside your own config.yml
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/lazygit
mkdir -p "$dest"
[ -f "$dest/tweed.yml" ] && cp "$dest/tweed.yml" "$dest/tweed.yml.bak"
cp "$dir/tweed.yml" "$dest/"
echo "Done. zsh/tweed.zsh points LG_CONFIG_FILE at config.yml plus tweed.yml; without it:"
echo "  export LG_CONFIG_FILE=\"\$HOME/.config/lazygit/config.yml,\$HOME/.config/lazygit/tweed.yml\""
