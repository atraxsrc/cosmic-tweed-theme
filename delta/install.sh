#!/usr/bin/env bash
# Installs the Tweed delta config into ~/.config/delta/. It does not edit
# ~/.gitconfig: add the [include] it prints.
set -e
dir="$(cd "$(dirname "$0")" && pwd)"
dest=~/.config/delta
mkdir -p "$dest"
[ -f "$dest/tweed.gitconfig" ] && cp "$dest/tweed.gitconfig" "$dest/tweed.gitconfig.bak"
cp "$dir/tweed.gitconfig" "$dest/"
if [ -f ~/.gitconfig ] && grep -qF "delta/tweed.gitconfig" ~/.gitconfig; then
    echo "Done. ~/.gitconfig already includes it."
else
    echo "Done. Add to ~/.gitconfig:"
    echo "  [include]"
    echo "      path = ~/.config/delta/tweed.gitconfig"
fi
echo "Needs the bat Tweed theme for the code colours: ./bat/install.sh"
