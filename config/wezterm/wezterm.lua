-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Changing the color scheme:
config.color_scheme = "catppuccin-macchiato"

-- Font settings:

-- This video was helpful in understanding how to set up fonts:
-- https://www.youtube.com/watch?v=mQdB_kHyZn8&t=543s
config.font_size = 16
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  { family = "Symbols Nerd Font Mono", scale = 0.75 },
})
-- Use the cap-height font metrics of the base and the current font to adjust
-- the size of secondary fonts (such as bold or italic faces) to visually match
-- the size of the base font.
-- For more information, see:
-- https://wezfurlong.org/wezterm/config/lua/config/use_cap_height_to_scale_fallback_fonts.html
config.use_cap_height_to_scale_fallback_fonts = true

-- Window settings:

-- Disable the title bar but enable the resizable border.
-- For more information, see:
-- https://wezfurlong.org/wezterm/config/lua/config/window_decorations.html
config.window_decorations = "RESIZE"

-- and finally, return the configuration to wezterm
return config
