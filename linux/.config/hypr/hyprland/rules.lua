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

hl.layer_rule {
  name = 'wlr-which-key',
  match = {
    namespace = 'wlr_which_key',
  },
  no_anim = true,
}

hl.window_rule {
  name = 'no-screenshare',
  match = {
    class = '1password',
  },
  no_screen_share = true,
}

hl.window_rule {
  name = '1password-special',
  match = {
    class = '1password',
  },
  workspace = 'special:magic',
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
}

window_rule {
  name = 'float-apps',
  match = {
    class = class_pattern('org.gnome.Nautilus', '1password', 'org.pulseaudio.pavucontrol', 'com.gabm.satty', chrome_pwa_class 'Google Password Manager'),
  },
  float = true,
  size = {
    'monitor_w*0.8',
    'monitor_h*0.7',
  },
}

hl.window_rule {
  name = 'maximised-apps',
  match = {
    class = 'google-chrome',
  },
  scrolling_width = 1,
}

hl.window_rule {
  name = 'quick-terminal',
  match = {
    class = 'io.ghostty.quick.*',
  },
  float = true,
  workspace = 'special:magic',
  size = {
    'monitor_w*0.9',
    'monitor_h*0.8',
  },
}

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

hl.window_rule {
  name = 'workspace-1',
  match = {
    class = '(com.mitchellh.ghostty|google-chrome)',
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
    class = class_pattern(chrome_pwa_class 'GitHub', chrome_pwa_class 'Jira'),
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

hl.window_rule {
  name = 'noctalia-settings-special',
  match = {
    class = 'dev.noctalia.Noctalia.Settings',
  },
  workspace = 'special:magic',
  float = true,
  size = {
    'monitor_w*0.7',
    'monitor_h*0.8',
  },
  center = true,
}

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
