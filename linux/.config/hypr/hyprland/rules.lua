---@diagnostic disable: undefined-global

-- Chrome regenerates a PWA's app-id and profile suffix on every (re)install,
-- so resolve its current window class by name at config-load time instead
-- of hardcoding "chrome-<id>-<profile>" here.
local function chrome_pwa_class(name)
  local handle = io.popen("chrome-pwa-class '" .. name .. "' 2>/dev/null")
  if not handle then
    return nil
  end
  local result = handle:read '*l'
  handle:close()
  if result == nil or result == '' then
    return nil
  end
  return result
end

-- Combine class strings/patterns into a single regex alternation, dropping
-- any that failed to resolve (e.g. a PWA not installed on this machine).
local function class_pattern(...)
  local parts = {}
  for _, part in ipairs { ... } do
    if part then
      table.insert(parts, part)
    end
  end
  if #parts == 0 then
    return nil
  end
  if #parts == 1 then
    return parts[1]
  end
  return '(' .. table.concat(parts, '|') .. ')'
end

-- Like hl.window_rule, but skipped entirely if match.class resolved to nil.
local function window_rule(rule)
  if rule.match and rule.match.class == nil then
    return
  end
  hl.window_rule(rule)
end

-- Layer rules

hl.layer_rule {
  name = 'wlr-which-key',
  match = {
    namespace = 'wlr_which_key',
  },
  no_anim = true,
}

-- Send utility windows to the special:magic scratchpad workspace

-- special:magic behaves like a "one app at a time" overlay: Monocle
-- fullscreens whichever window is current and the native cycle_next
-- dispatcher switches between them (see keybinds.lua's CTRL+S bind) - no
-- custom raise/z-order logic needed. gaps_out insets that fullscreen
-- window so it reads as a centered card instead of edge-to-edge - sized
-- for this monitor's 1920x1280 logical resolution (2880x1920 @ 1.5x
-- scale, per hyprmoncfg-monitors.lua); retune if that changes.
hl.workspace_rule {
  workspace = 'special:magic',
  layout = 'monocle',
  gaps_out = { top = 160, right = 192, bottom = 160, left = 192 },
}

hl.window_rule {
  name = '1password-special',
  match = {
    class = '1password',
  },
  workspace = 'special:magic',
  no_screen_share = true,
}

hl.window_rule {
  name = 'satty-special',
  match = {
    class = 'com.gabm.satty',
  },
  workspace = 'special:magic',
}

hl.window_rule {
  name = 'nautilus-special',
  match = {
    class = 'org.gnome.Nautilus',
  },
  workspace = 'special:magic',
}

window_rule {
  name = 'google-password-manager-special',
  match = {
    class = chrome_pwa_class 'Google Password Manager',
  },
  workspace = 'special:magic',
  no_screen_share = true,
}

hl.window_rule {
  name = 'pavucontrol-special',
  match = {
    class = 'org.pulseaudio.pavucontrol',
  },
  workspace = 'special:magic',
}

-- Use scrolling layout at full width for Chrome

hl.window_rule {
  name = 'maximised-apps',
  match = {
    class = 'google-chrome',
  },
  scrolling_width = 1,
}

-- Ghostty's quick-launch dropdown terminal

hl.window_rule {
  name = 'quick-terminal',
  match = {
    class = 'io.ghostty.quick.*',
  },
  workspace = 'special:magic',
}

-- Float, pin, and corner-position picture-in-picture windows

hl.window_rule {
  name = 'picture-in-picture-meet',
  match = {
    title = '^Meet.*',
  },
  float = true,
  pin = true,
  size = {
    'monitor_w*0.3',
    'monitor_h*0.4',
  },
  move = {
    'monitor_w-(monitor_w*0.3)-12',
    'monitor_h-(monitor_h*0.4)-12',
  },
}

hl.window_rule {
  name = 'picture-in-picture',
  match = {
    title = '(Picture in picture|Picture in Picture|picture in picture|picture_in_picture|picture-in-picture)',
  },
  float = true,
  pin = true,
  size = {
    'monitor_w*0.4',
    'monitor_h*0.35',
  },
  move = {
    'monitor_w-(monitor_w*0.4)-12',
    'monitor_h-(monitor_h*0.35)-12',
  },
}

-- Hyprland's screen-share source picker

hl.window_rule {
  name = 'screen-share-popup',
  match = {
    class = 'hyprland-share-picker',
  },
  float = true,
  no_anim = true,
  size = {
    'monitor_w*0.4',
    'monitor_h*0.5',
  },
  center = true,
}

-- Assign apps to their default workspace

hl.window_rule {
  name = 'workspace-1',
  match = {
    class = 'com.mitchellh.ghostty',
  },
  workspace = 1,
}

window_rule {
  name = 'workspace-2',
  match = {
    class = class_pattern('slack', chrome_pwa_class 'Google Chat'),
  },
  workspace = 2,
}

window_rule {
  name = 'workspace-3',
  match = {
    class = class_pattern(chrome_pwa_class 'Gmail', chrome_pwa_class 'Google Calendar'),
  },
  workspace = 3,
}

window_rule {
  name = 'workspace-4',
  match = {
    class = class_pattern(
      chrome_pwa_class 'GitHub',
      chrome_pwa_class 'Jira',
      chrome_pwa_class 'Linear'
    ),
  },
  workspace = 4,
}

window_rule {
  name = 'workspace-5',
  match = {
    class = class_pattern(chrome_pwa_class 'Heroku', chrome_pwa_class 'Cloudflare'),
  },
  workspace = 5,
}

hl.window_rule {
  name = 'workspace-7',
  match = {
    class = class_pattern('Spotify', chrome_pwa_class 'YouTube'),
  },
  workspace = 7,
}

hl.window_rule {
  name = 'workspace-8',
  match = {
    class = 'org.telegram.desktop',
  },
  workspace = 8,
}

window_rule {
  name = 'workspace-9',
  match = {
    class = chrome_pwa_class 'Home Assistant',
  },
  workspace = 9,
}

window_rule {
  name = 'workspace-10',
  match = {
    class = chrome_pwa_class 'Google Meet',
  },
  workspace = 10,
}

-- Apps whose first window goes to the laptop screen (workspace 10)
-- while an external monitor is connected, and to their default
-- workspace otherwise. Later windows always use the default one.
-- Decided on each open rather than with a static rule, so it follows
-- hotplugs that hyprmoncfgd applies without a reload. A static
-- workspace rule for these apps would still switch the external
-- monitor to its workspace, so they must not have one.
local laptop_screen_apps = {}
laptop_screen_apps['google-chrome'] = 1
local datadog_class = chrome_pwa_class 'Datadog'
if datadog_class then
  laptop_screen_apps[datadog_class] = 5
end

local function has_other_window(window)
  for _, other in ipairs(hl.get_windows { class = window.class }) do
    if other.class == window.class and other.address ~= window.address then
      return true
    end
  end
  return false
end

-- open_early moves the window before it maps.
hl.on('window.open_early', function(window)
  local default_workspace = laptop_screen_apps[window.class]
  if not default_workspace then
    return
  end
  local workspace = default_workspace
  if #hl.get_monitors() > 1 and not has_other_window(window) then
    workspace = 10
  end
  hl.dispatch(hl.dsp.window.move {
    workspace = workspace,
    window = window,
    follow = false,
  })
end)

-- Send the Noctalia settings window to the special:magic overlay

hl.window_rule {
  name = 'noctalia-settings-special',
  match = {
    class = 'dev.noctalia.Noctalia.Settings',
  },
  workspace = 'special:magic',
}

-- Miscellaneous window-behavior fixes

hl.window_rule {
  name = 'suppress-maximize-events',
  match = {
    class = '.*',
  },
  suppress_event = 'maximize',
}

hl.window_rule {
  name = 'fix-xwayland-drags',
  match = {
    class = '^$',
    title = '^$',
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
}

hl.window_rule {
  name = 'move-hyprland-run',
  match = {
    class = 'hyprland-run',
  },
  move = {
    '20',
    'monitor_h-120',
  },
  float = true,
}
