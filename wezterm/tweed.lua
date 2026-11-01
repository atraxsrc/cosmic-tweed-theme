-- Tweed for WezTerm, part of cosmic-tweed-theme (MIT).
-- Colours follow the COSMIC Terminal scheme (cosmic-term/).
--
-- Install: ./wezterm/install.sh puts this in ~/.config/wezterm/, then in
-- ~/.config/wezterm/wezterm.lua:
--   config.colors = require("tweed")
-- To follow COSMIC's Dark / Light toggle with the Tweed Day half installed too:
--   local dark = (wezterm.gui and wezterm.gui.get_appearance() or "Dark"):find("Dark")
--   config.colors = require(dark and "tweed" or "tweedday")

return {
  foreground = "#D6D1C9",
  background = "#292B31",

  cursor_bg = "#BDA07F",
  cursor_fg = "#292B31",
  cursor_border = "#BDA07F",
  compose_cursor = "#F28B7C",

  selection_bg = "#40434C",
  selection_fg = "none",

  scrollbar_thumb = "#6B6B6E",
  split = "#6B6B6E",

  -- black, red, green, yellow, blue, magenta, cyan, white
  ansi = { "#151619", "#E77D6C", "#919E85", "#F3E9BD", "#BDA07F", "#F28B7C", "#9B907F", "#E8E3DA" },
  brights = { "#6B6B6E", "#ED9C8F", "#A3AE99", "#F8F2D7", "#C7AF93", "#F6ACA1", "#B7A593", "#F3EFE8" },

  copy_mode_active_highlight_bg = { Color = "#BDA07F" },
  copy_mode_active_highlight_fg = { Color = "#292B31" },
  copy_mode_inactive_highlight_bg = { Color = "#F3E9BD" },
  copy_mode_inactive_highlight_fg = { Color = "#292B31" },

  quick_select_label_bg = { Color = "#F28B7C" },
  quick_select_label_fg = { Color = "#292B31" },
  quick_select_match_bg = { Color = "#F3E9BD" },
  quick_select_match_fg = { Color = "#292B31" },

  tab_bar = {
    background = "#292B31",
    active_tab = { bg_color = "#BDA07F", fg_color = "#292B31", intensity = "Bold" },
    inactive_tab = { bg_color = "#30323A", fg_color = "#A8B49D" },
    inactive_tab_hover = { bg_color = "#363840", fg_color = "#D6D1C9" },
    new_tab = { bg_color = "#292B31", fg_color = "#A8B49D" },
    new_tab_hover = { bg_color = "#363840", fg_color = "#BDA07F" },
  },
}
