local wezterm = require 'wezterm';
return {
   colors = {
      background = "#1a2026",
      foreground = "#dadada",
      cursor_bg = "#9ce5c0",
      cursor_fg = "#29343d"
   },
   -- color_scheme = "JetBrains Darcula",
   font = wezterm.font("VictorMono"),
   enable_Wayland = true,
   enable_tab_bar = false,
   window_padding = {
      bottom = 0,
      left = 0.5,
      right = 0.5,
      top = 0,
   },
   exit_behavior = "Close",
   font_size  = 12,
}
