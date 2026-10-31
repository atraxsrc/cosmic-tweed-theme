# COSMIC Terminal schemes

Colour schemes for COSMIC Terminal. The desktop `.ron` in `cosmic/` does not
colour ANSI text, so the terminal needs its own import.

1. COSMIC Terminal → **View → Color schemes…** (not Settings → Appearance)
2. **Dark** tab → **Import** → a `.ron` from this folder
3. View → Settings → Appearance → Color scheme (dark) → the scheme name

If a profile is set as default, set the scheme on that profile too or the
dropdown will look like it did nothing. `cosmic/install.sh` selects **Tweed**,
so import that one at least.

Every scheme here keeps the 16 ANSI colours of Tweed. Only the plain text
colour and the dim text change, so bat, lsd, starship, nala and btop look the
same whichever one you pick. The cursor stays tan ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F`.

The ANSI slots follow the rice: `red` is brick ![#E77D6C](https://placehold.co/12x12/e77d6c/e77d6c.png) `#E77D6C`, the one colour
kept for what is wrong; `green` is moss ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85`; `yellow` is cream
![#F3E9BD](https://placehold.co/12x12/f3e9bd/f3e9bd.png) `#F3E9BD`; `blue` is the tan accent ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F`, so nala's `Updated:` and
`Downloaded:` labels sit in the rice's own colour next to the moss
`No Change:`; `magenta` is salmon ![#F28B7C](https://placehold.co/12x12/f28b7c/f28b7c.png) `#F28B7C`, the warm colour numbers and
warnings take; `cyan` is putty ![#9B907F](https://placehold.co/12x12/9b907f/9b907f.png) `#9B907F`; `white` is
![#E8E3DA](https://placehold.co/12x12/e8e3da/e8e3da.png) `#E8E3DA`. Directories are not affected: `LS_COLORS` in `zsh/tweed.zsh` colours
them in truecolor.

## Which one

Linen ![#D6D1C9](https://placehold.co/12x12/d6d1c9/d6d1c9.png) `#D6D1C9` is the default. The others move through Tweed's own greys
and tints: calmer above it, brighter below it, for whoever finds the default
glares at night or reads too dim by day.

| Scheme | Plain text | Contrast | Also used for |
|--------|------------|----------|---------------|
| Tweed Putty | ![#9F9A91](https://placehold.co/12x12/9f9a91/9f9a91.png) `#9F9A91` | 5.1:1 | muted text, the dim text colour |
| Tweed Olive | ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D` | 6.5:1 | directories (`LS_COLORS`), types |
| Tweed Moss | ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85` | 5.0:1 | strings, success, the `green` slot |
| Tweed Tan | ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F` | 5.7:1 | the accent, the cursor and the `blue` slot |
| Tweed Oat | ![#C7C0B5](https://placehold.co/12x12/c7c0b5/c7c0b5.png) `#C7C0B5` | 7.8:1 | a neutral a step from plain text |
| **Tweed** (default) | ![#D6D1C9](https://placehold.co/12x12/d6d1c9/d6d1c9.png) `#D6D1C9` | 9.3:1 | the desktop text colour |

When plain text shares a colour with an ANSI slot, output in that slot stops
standing out: directories in Tweed Olive, for example, look like plain text.
Brick errors and salmon numbers stand out more against the dimmer
schemes than against linen.

**Bold:** `bright_foreground` (![#F3EFE8](https://placehold.co/12x12/f3efe8/f3efe8.png) `#F3EFE8`) only colours bold text when
`use_bright_bold` is on. The baseline config in `cosmic/config/` leaves it off,
so bold text is the plain text colour at weight 800.

Previews are rendered in Fira Mono on the theme background ![#292B31](https://placehold.co/12x12/292b31/292b31.png) `#292B31`, not
taken from the terminal. In COSMIC you get Maple Mono at 77% opacity over the
wallpaper, so text looks a little softer and contrast a little lower.

## Dark

**Tweed** · `Tweed-term.ron` · linen ![#D6D1C9](https://placehold.co/12x12/d6d1c9/d6d1c9.png) `#D6D1C9`, 9.3:1. The default.

![Tweed](../assets/cosmic-term/Tweed-term.png)

**Tweed Putty** · `Tweed-term-putty.ron` · ![#9F9A91](https://placehold.co/12x12/9f9a91/9f9a91.png) `#9F9A91`, 5.1:1. Muted text, the dim text colour.

![Tweed Putty](../assets/cosmic-term/Tweed-term-putty.png)

**Tweed Olive** · `Tweed-term-olive.ron` · ![#A8B49D](https://placehold.co/12x12/a8b49d/a8b49d.png) `#A8B49D`, 6.5:1. Directories (`LS_COLORS`), types.

![Tweed Olive](../assets/cosmic-term/Tweed-term-olive.png)

**Tweed Moss** · `Tweed-term-moss.ron` · ![#919E85](https://placehold.co/12x12/919e85/919e85.png) `#919E85`, 5.0:1. Strings, success, the `green` slot.

![Tweed Moss](../assets/cosmic-term/Tweed-term-moss.png)

**Tweed Tan** · `Tweed-term-tan.ron` · ![#BDA07F](https://placehold.co/12x12/bda07f/bda07f.png) `#BDA07F`, 5.7:1. The accent, the cursor and the `blue` slot.

![Tweed Tan](../assets/cosmic-term/Tweed-term-tan.png)

**Tweed Oat** · `Tweed-term-oat.ron` · ![#C7C0B5](https://placehold.co/12x12/c7c0b5/c7c0b5.png) `#C7C0B5`, 7.8:1. A neutral a step from plain text.

![Tweed Oat](../assets/cosmic-term/Tweed-term-oat.png)

Contrast is plain text on the theme background, WCAG 2.
