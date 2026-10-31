# Firefox - Tweed

Firefox chrome matching the COSMIC Tweed rice. Ported from the DarkGold
baseline (theme recipe and stylesheets), recoloured for flint and tan.

## Palette

Stylesheets:

| Hex       | Role                      |
|-----------|---------------------------|
| ![#292B31](https://placehold.co/12x12/292b31/292b31.png) `#292B31` | Frame, page chrome, text on tan |
| ![#30323A](https://placehold.co/12x12/30323a/30323a.png) `#30323A` | Panels, menus             |
| ![#474445](https://placehold.co/12x12/474445/474445.png) `#474445` | Menu hover row (tan tinted into the panel) |
| ![#524C4B](https://placehold.co/12x12/524c4b/524c4b.png) `#524C4B` | Menu pressed row          |
| ![#40434C](https://placehold.co/12x12/40434c/40434c.png) `#40434C` | Separators, menu border   |
| ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` | Accent, URL bar border, hover rail |
| ![#C7AF93](https://placehold.co/12x12/c7af93/c7af93.png) `#C7AF93` | Accent hover              |
| ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85` | Menu text, new tab active |
| ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D` | Links                     |
| ![#F3EFE8](https://placehold.co/12x12/f3efe8/f3efe8.png) `#F3EFE8` | Hover text                |

## Structure

```
firefox/
├── theme/            WebExtension theme source (Cosmic Tweed)
│   ├── manifest.json     DarkGold's 24 colour keys + URL bar ring and selection
│   └── icons/            32 / 48 / 64 / 96 / 128, cropped from tweed-vinyl
├── chrome/
│   ├── userChrome.css    browser UI: rounded corners, tan menu hover
│   └── userContent.css   new tab page: tan accents, blank shortcut tiles
└── install.sh            copies chrome/ into the default profile
```

Two layers, use one or both:

1. **Theme (colours):** `theme/` colours the toolbar, tabs, URL bar, menus,
   sidebar and new tab page. This is the main look. Load it from the folder
   (below) or from addons.mozilla.org once it is listed there.
2. **Stylesheets (optional):** `chrome/` adds rounded corners, tan menu
   hover, tan accents and a blank new-tab grid on top of the theme. They
   also work with Firefox's built-in Dark theme.

## Theme

Same colour keys and roles as DarkGold's Firefox theme: icons take the calm
colour (moss here, gold there), and everything "hot" (tab line, pressed
button, menu and sidebar selection, loading) takes the accent (tan here,
coral there). Tweed's hot roles are salmon and brick; brick is kept for errors and does
not appear in the chrome.
One extra key, `toolbar_field_border_focus`, pins the focused URL bar ring to
tan so it does not fall back to the desktop accent when
`widget.non-native-theme.use-theme-accent` is on (the Firefox default on
Linux). Two more, `toolbar_field_highlight` and `toolbar_field_highlight_text`,
colour selected text in the URL bar the same way, as DarkGold does. Every
text colour clears WCAG AA (4.5:1) on its background; icons and the tab
line clear 3:1.

| Hex       | Where in the theme                          |
|-----------|---------------------------------------------|
| ![#292B31](https://placehold.co/12x12/292b31/292b31.png) `#292B31` | Frame, new tab, text on tan selections    |
| ![#30323A](https://placehold.co/12x12/30323a/30323a.png) `#30323A` | Toolbar, menus                              |
| ![#40434C](https://placehold.co/12x12/40434c/40434c.png) `#40434C` | URL bar field, button hover, sidebar border |
| ![#D6D1C9](https://placehold.co/12x12/d6d1c9/d6d1c9.png) `#D6D1C9` | Body text                                   |
| ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D` | Menu border                                 |
| ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85` | Icons, inactive tab text                    |
| ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` | Focused tab text, focused URL bar ring and text selection, tab line, pressed button, menu and sidebar selection, loading, attention |

Build the package:

```bash
cd theme && zip -r -X ../cosmic-tweed.zip . -x '.*'
```

Try it without installing: `about:debugging#/runtime/this-firefox` → **Load
Temporary Add-on** → pick `theme/manifest.json`. It is gone on restart. To
keep it, upload the zip to addons.mozilla.org (self-distribution is enough)
and install the signed `.xpi` it hands back.

## Stylesheets

```bash
./install.sh
```

Copies `chrome/` into your `*.default-release` profile, backs up anything it
replaces, and adds two prefs to `user.js`: one so Firefox reads the
stylesheets, one so the accent (URL bar ring, buttons) comes from the theme
and not the desktop. Then **fully restart**
Firefox - `userChrome.css` is parsed only at startup.

To install into another profile (a test profile, say), pass its folder:

```bash
./install.sh ~/.mozilla/firefox/<profile>
```

Every rice's `install.sh` takes the same argument, so switching a test
profile between rices is one command plus a restart.

Manual equivalent:

1. `about:config` → `toolkit.legacyUserProfileCustomizations.stylesheets` = `true`
2. `about:support` → Profile Directory → Open Directory
3. Copy `chrome/` in
4. Restart

To undo: delete the two files from the profile's `chrome/` folder and restart.

## Notes

- **Never set `--panel-*` or `--arrowpanel-*` on `:root`.** Those variables leak
  into the toolbar and blank the URL bar. They stay on the popup elements.
- **Context menus do not get an extra element border.** A second stroke made
  the right-click panel look detached. Hover is a tan-tinted ![#474445](https://placehold.co/12x12/474445/474445.png) `#474445`
  row with a 3px tan rail on the left, not a full ring.
- **Native menu styling is switched off** (`appearance: none`) on menus and
  menu rows. Without it the COSMIC/GTK hover paints over the colours above.
- **`[_moz-menuactive="true"]` is required.** Firefox marks the active
  context-menu row with that attribute, not only `:hover`.
- **`userContent.css` is colours plus one hide rule.** It sets accent / focus /
  link colours and hides shortcut artwork (`opacity: 0`) so the new-tab tiles
  stay blank. No size or position rules on the tiles.
- Built against **Firefox 154**.

## License

MIT, same as the rest of the repo.
