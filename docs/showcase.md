# Tweed

> Flint, linen and tan, with brick kept for what is wrong. Wool, wood and a record on the turntable.

Pop!_OS 24.04 on the COSMIC desktop, one palette carried through the whole
machine: desktop, terminal, shell, editor, browser. This note is the rice
describing itself, written in Markdown and rendered by **Postilla**.

## Palette

Every text colour is checked against the window background ![#292B31](https://placehold.co/12x12/292b31/292b31.png) `#292B31`.

| Role | Hex | Contrast on background |
|------|-----|------------------------|
| Text | ![#D6D1C9](https://placehold.co/12x12/d6d1c9/d6d1c9.png) `#D6D1C9` | 9.3:1 |
| Tan, accent | ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` | 5.7:1 |
| Salmon, warning | ![#F28B7C](https://placehold.co/12x12/f28b7c/f28b7c.png) `#F28B7C` | 5.9:1 |
| Brick, error | ![#E77D6C](https://placehold.co/12x12/e77d6c/e77d6c.png) `#E77D6C` | 5.1:1 |
| Moss, success | ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85` | 5.0:1 |
| Cream, symlinks | ![#F3E9BD](https://placehold.co/12x12/f3e9bd/f3e9bd.png) `#F3E9BD` | 11.6:1 |
| Olive, directories | ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D` | 6.5:1 |
| Muted | ![#9F9A91](https://placehold.co/12x12/9f9a91/9f9a91.png) `#9F9A91` | 5.1:1 |

Containers sit one step away from the background at ![#30323A](https://placehold.co/12x12/30323a/30323a.png) `#30323A`, which is
what frosted glass blurs into.

## Where the colours go

```mermaid
flowchart LR
    P[Tweed palette] --> D[COSMIC desktop<br/>Tweed.ron, Dark slot]
    P --> T[COSMIC Terminal<br/>Tweed]
    P --> S[zsh layer<br/>LS_COLORS, highlighting, starship]
    P --> E[Postilla<br/>syntax theme from the terminal scheme]
    T --> B[btop, bat, lsd, fastfetch]
    D --> F[Firefox<br/>built-in Dark + userChrome]
```

## Setup, in order

- [x] Import `cosmic/Tweed.ron` into Appearance, **Dark** slot
- [x] Import `cosmic-term/Tweed-term.ron`, pick **Tweed** for the profile
- [x] `./icons/install.sh` for the **Cosmic-Tweed** icons, `./cosmic/install.sh` for fonts and the terminal look
- [x] `./zsh/install.sh`, `./lsd/install.sh`, `./fastfetch/install.sh`
- [x] Cursor: Oxygen-Tweed-Tan
- [x] Wallpaper: `backgrounds/tweed-vinyl.png`
- [ ] Screenshot for the README

## The baseline every rice shares

```ron
corner_radii: (
    radius_xs: (2.0, 2.0, 2.0, 2.0),   // squared corners
    radius_xl: (2.0, 2.0, 2.0, 2.0),
),
frosted: Low,
frosted_windows: true,
frosted_panel: true,
frosted_applets: true,
frosted_maximized_apps: false,
gaps: (0, 7),
active_hint: 1,
```

Contrast is the WCAG ratio[^1], where $L$ is relative luminance:

```typst
$ (L_1 + 0.05) / (L_2 + 0.05) >= 4.5 $
```

---

*Rendered in Postilla, a Markdown notes app for COSMIC. The window is painted
with this rice's terminal scheme, imported as a syntax theme.*

[^1]: Web Content Accessibility Guidelines, success criterion 1.4.3. Normal text wants 4.5:1, large text 3:1.
