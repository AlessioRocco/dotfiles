local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- Color scheme
config.color_scheme = "Catppuccin Macchiato"

-- Font
config.font_size = 16
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  { family = "Symbols Nerd Font Mono", scale = 0.75 },
})
config.use_cap_height_to_scale_fallback_fonts = true

-- Window
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Maximize on startup
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Hide tab bar (tmux handles this)
config.enable_tab_bar = false

return config
