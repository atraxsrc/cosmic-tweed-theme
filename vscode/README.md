# Cosmic Tweed for Cursor

Colour theme for [Cursor](https://cursor.com) from the COSMIC
[Tweed](https://github.com/atraxsrc/cosmic-tweed-theme) rice: **Cosmic Tweed**, dark
only. It is a plain VS Code theme extension, so VS Code and VSCodium take it
too.

## Install

```bash
./vscode/install.sh                # Cursor
./vscode/install.sh code codium    # VS Code / VSCodium instead
```

It packs this folder into `vscode/cosmic-tweed-theme-<version>.vsix` and installs
that with the editor's CLI (`cursor --install-extension`), so the theme is
listed under Extensions and running the script again updates it. Then press
<kbd>Ctrl</kbd>+<kbd>K</kbd> <kbd>Ctrl</kbd>+<kbd>T</kbd> and pick **Cosmic Tweed**.

No CLI on the PATH (an AppImage, say): the script still builds the `.vsix`;
install it from Extensions → `...` → **Install from VSIX**.

Tweed has no light half, so there is nothing for COSMIC's Dark / Light toggle to
switch to; leave `window.autoDetectColorScheme` off, or pair it with another
rice's light theme in `workbench.preferredLightColorTheme`.

## What it colours

Code is coloured the way Neovim is in the rice (`nvim/colors/tweed.lua`):

| Role | Tweed |
|------|----|
| Keywords, tags | ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` |
| Functions, tag attributes | ![#F3E9BD](https://placehold.co/12x12/C9C2B4/C9C2B4.png) `#F3E9BD` |
| Strings | ![#919E85](https://placehold.co/12x12/9FA5A9/9FA5A9.png) `#919E85` |
| Numbers, constants | ![#F28B7C](https://placehold.co/12x12/D87C4A/D87C4A.png) `#F28B7C` |
| Types, classes, modules | ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D` |
| Imports, macros, decorators, escapes, `this` / `self` | ![#B49A7B](https://placehold.co/12x12/9D7E6F/9D7E6F.png) `#B49A7B` |
| Parameters (italic) | ![#ABA69C](https://placehold.co/12x12/A5AEB4/A5AEB4.png) `#ABA69C` |
| Operators, punctuation | ![#9F9A91](https://placehold.co/12x12/7F7F7F/7F7F7F.png) `#9F9A91` |
| Comments (italic) | ![#6B6B6E](https://placehold.co/12x12/565D60/565D60.png) `#6B6B6E` |
| Accent | ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` |
| Errors, deleted, conflicts | ![#E77D6C](https://placehold.co/12x12/DE6145/DE6145.png) `#E77D6C` |

The workbench takes the window colour of the rice's `cosmic/Tweed.ron` for the
editor, side bars, panel, title and status bar, the container colours for
menus, hovers, inputs and the command palette, and the tan accent for the
active tab line, buttons, badges and the menu highlight. Button hover is the
lighter tan ![#C7AF93](https://placehold.co/12x12/c7af93/c7af93.png) `#C7AF93`. The integrated terminal uses the rice's COSMIC
Terminal scheme (`cosmic-term/`), so command output looks the same as in
COSMIC Terminal.

Cursor's own panels (Agent, chat, inline diffs) have no colour keys of their
own. Cursor builds them from standard ones, and the theme sets those: the
button colour is the agent's accent, the side bar and panel colours are its
surfaces, the diff colours are its accept / reject highlights, and the
terminal's `blue` slot colours its links.

## Contrast

Text is at least 4.5:1 on the window background and on menus and hovers,
comments and line numbers at least 3:1. Tan ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` is 5.7:1 on the window background and 5.2:1 on the
container colour ![#30323A](https://placehold.co/12x12/30323a/30323a.png) `#30323A`, so it stays the same colour everywhere, the
match highlight in the suggest and hover widgets included. Keywords on the
highlighted current line are 4.7:1; comments dip under 3:1 there.
