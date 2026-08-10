require 'hyprland.autostart'
require 'hyprland.keybinds'
require 'hyprland.rules'
require 'hyprland.input'
require 'hyprland.style'
require 'monitors'

hl.config {
  general = {
    no_focus_fallback = true,
  },

  ecosystem = {
    no_donation_nag = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = 'master',
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    font_family = 'GeistMono Nerd Font Mono',
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    focus_on_activate = true,
    middle_click_paste = true,
  },

  xwayland = {
    force_zero_scaling = true,
  },
}

-- For Noctalia Color templates
require("noctalia").apply_theme()
