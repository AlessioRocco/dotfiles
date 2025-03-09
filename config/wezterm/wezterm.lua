-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

-- Plugins
local smart_splits =
  wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local workspace_switcher = wezterm.plugin.require(
  "https://github.com/MLFlexer/smart_workspace_switcher.wezterm"
)

-- Functions
local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local get_last_folder_segment = function(cwd)
  local default_value = "N/A"
  if cwd == nil then
    return default_value
  end

  if cwd.scheme == "file" then
    local path = {}
    for segment in string.gmatch(cwd.path, "[^/]+") do
      table.insert(path, segment)
    end
    return path[#path]
  else
    return default_value
  end
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir or ""
  return get_last_folder_segment(current_dir)
end

local function get_process(tab)
  local process_icons = {
    ["bash"] = wezterm.nerdfonts.cod_terminal_bash,
    ["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["cargo"] = wezterm.nerdfonts.dev_rust,
    ["curl"] = wezterm.nerdfonts.mdi_flattr,
    ["docker"] = wezterm.nerdfonts.linux_docker,
    ["docker-compose"] = wezterm.nerdfonts.linux_docker,
    ["dotnet"] = wezterm.nerdfonts.md_language_csharp,
    ["fish"] = wezterm.nerdfonts.seti_powershell,
    ["gh"] = wezterm.nerdfonts.dev_github_badge,
    ["git"] = wezterm.nerdfonts.dev_git,
    ["go"] = wezterm.nerdfonts.seti_go,
    ["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
    ["kubectl"] = wezterm.nerdfonts.linux_docker,
    ["kuberlr"] = wezterm.nerdfonts.linux_docker,
    ["lazydocker"] = wezterm.nerdfonts.linux_docker,
    ["lazygit"] = wezterm.nerdfonts.dev_git,
    ["lua"] = wezterm.nerdfonts.seti_lua,
    ["make"] = wezterm.nerdfonts.seti_makefile,
    ["node"] = wezterm.nerdfonts.dev_nodejs_small,
    ["nvim"] = wezterm.nerdfonts.custom_neovim,
    ["psql"] = wezterm.nerdfonts.dev_postgresql,
    ["pwsh"] = wezterm.nerdfonts.seti_powershell,
    ["ruby"] = wezterm.nerdfonts.cod_ruby,
    ["stern"] = wezterm.nerdfonts.linux_docker,
    ["sudo"] = wezterm.nerdfonts.fa_hashtag,
    ["tail"] = wezterm.nerdfonts.fa_file_text,
    ["vim"] = wezterm.nerdfonts.dev_vim,
    ["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
    ["zsh"] = wezterm.nerdfonts.dev_terminal,
  }
  local process_name = basename(tab.active_pane.foreground_process_name)

  local icon = process_icons[process_name]
    or wezterm.nerdfonts.seti_checkbox_unchecked

  return icon
end

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- General settings:
config.default_cwd = wezterm.home_dir

-- Changing the color scheme:
config.color_scheme = "Catppuccin Macchiato"

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

-- Set the window padding to zero.
-- For more information, see:
-- https://wezfurlong.org/wezterm/config/lua/config/window_padding.html
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Maximize default window on startup.
-- For more information, see:
-- https://wezfurlong.org/wezterm/config/lua/gui-events/gui-startup.html
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

-- Pane settings:
config.inactive_pane_hsb = {
  saturation = 0.4,
  brightness = 0.5,
}

-- Tab/Status Bar settings:

-- Disables the 'modern' look of the tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.tab_max_width = 60

wezterm.on(
  "format-tab-title",
  function(tab, tabs, panes, config, hover, max_width)
    local active_pane = tab.active_pane

    local process = get_process(tab)
    local cwd = get_current_working_dir(tab)
    local zoom_icon = active_pane.is_zoomed
        and wezterm.nerdfonts.cod_zoom_in .. " "
      or ""

    local title = string.format(" %s ~ %s %s", process, cwd, zoom_icon)
    return {
      { Text = title },
    }
  end
)

wezterm.on("update-right-status", function(window, pane)
  local workspace_or_leader = window:active_workspace()
  -- Change the worspace name status if leader is active
  if window:active_key_table() then
    workspace_or_leader = window:active_key_table()
  end
  if window:leader_is_active() then
    workspace_or_leader = "LEADER"
  end

  local time = wezterm.strftime("%H:%M")

  window:set_right_status(wezterm.format({
    { Text = wezterm.nerdfonts.oct_table .. " " .. workspace_or_leader },
    { Text = " | " },
    { Text = wezterm.nerdfonts.md_clock .. " " .. time .. " " },
  }))
end)

-- Keybindings:
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
  -- Send C-a when pressing C-a twice
  {
    key = "a",
    mods = "LEADER|CTRL",
    action = act.SendKey({ key = "a", mods = "CTRL" }),
  },
  { key = "Space", mods = "LEADER", action = act.ActivateCommandPalette },
  { key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
  {
    key = "-",
    mods = "LEADER",
    action = wezterm.action({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    key = "\\",
    mods = "LEADER",
    action = wezterm.action({
      SplitHorizontal = { domain = "CurrentPaneDomain" },
    }),
  },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }),
  },
  {
    key = "x",
    mods = "LEADER",
    action = wezterm.action.CloseCurrentPane({ confirm = true }),
  },
  -- rotate panes
  {
    mods = "LEADER",
    key = "o",
    action = wezterm.action.RotatePanes("Clockwise"),
  },
  -- show the pane selection mode, but have it swap the active and selected panes
  {
    mods = "LEADER",
    key = "m",
    action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }),
  },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  {
    key = "n",
    mods = "LEADER",
    action = act.ActivateTabRelative(1),
  },

  -- Lastly, workspace
  {
    key = "s",
    mods = "LEADER",
    -- action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
    action = workspace_switcher.switch_workspace(),
  },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

smart_splits.apply_to_config(config)

-- and finally, return the configuration to wezterm
return config
