---@diagnostic disable: undefined-global
hl.config {
  binds = {
    hide_special_on_workspace_change = true,
    workspace_center_on = 1,
    movefocus_cycles_groupfirst = true,
    drag_threshold = 10,
  },
}

local browser = 'google-chrome-stable'
local terminal = 'ghostty'
local file_manager = 'nautilus'
local main_mod = 'SUPER'

local function quick_terminal(command)
  local class = 'io.ghostty.quick.' .. command:gsub('[^%w]', '_')
  return function()
    local windows = hl.get_windows({ class = class })
    if #windows > 0 then
      local ws = windows[1].workspace
      if ws and ws.special then
        hl.dispatch(hl.dsp.workspace.toggle_special(ws.config_name:gsub('^special:', '')))
      else
        hl.dispatch(hl.dsp.focus { window = windows[1] })
      end
    else
      hl.dispatch(hl.dsp.exec_cmd(string.format('ghostty --class=%s -e %s', class, command)))
    end
  end
end


local function quick_app(class, launch_cmd)
  return function()
    local windows = hl.get_windows({ class = class })
    if #windows > 0 then
      local ws = windows[1].workspace
      if ws and ws.special then
        hl.dispatch(hl.dsp.workspace.toggle_special(ws.config_name:gsub('^special:', '')))
      else
        hl.dispatch(hl.dsp.focus { window = windows[1] })
      end
    else
      hl.dispatch(hl.dsp.exec_cmd('runapp ' .. launch_cmd))
    end
  end
end

local function bind(key, action, description)
  hl.bind(key, action, { description = description })
end

local function bindm(key, action, description)
  hl.bind(main_mod .. ' + ' .. key, action, { description = description })
end

local function exec(cmd)
  return hl.dsp.exec_cmd(cmd)
end

local function run_app(app)
  return exec('runapp ' .. app)
end

local function system_action(action)
  return exec('system-action ' .. action)
end

local function define_submap(name, callback)
  hl.define_submap(name, function()
    callback()

    bind('ESCAPE', hl.dsp.submap 'reset', 'Exit Submap')
    bind('CAPS_LOCK', hl.dsp.submap 'reset', 'Exit Submap')
  end)
end

local function submap_bind(key, action, description)
  hl.bind(key, function()
    hl.dispatch(action)
    hl.dsp.submap 'reset'
  end, { description = description })
end

--------------------- Programs ---------------------
bindm('RETURN', exec('focus-or-launch com.mitchellh.ghostty ' .. terminal), 'Open Terminal')
bindm('B', exec('focus-or-launch google-chrome ' .. browser), 'Open Browser')
bindm('E', quick_terminal 'yazi', 'Open Terminal File Manager')
bindm('SHIFT + E', quick_app('org.gnome.Nautilus', file_manager), 'Open File Manager')

--------------------- Launchers ---------------------
bindm('SPACE', exec 'noctalia msg panel-toggle launcher', 'Toggle Launcher')
bindm('SHIFT + SPACE', run_app '1password --quick-access', 'Toggle 1Password')
bindm('Y', system_action 'clipboard toggle', 'Toggle Clipboard History')
bindm('O', exec 'wlr-which-key', 'Which Key')

bindm('ESCAPE', system_action 'session menu-toggle', 'Power Menu')

--------------------- Screenshot ---------------------
bindm('PRINT', exec 'wlr-which-key --initial-keys s', 'Screenshot')

--------------------- Apps ---------------------
bindm('A', exec 'wlr-which-key --initial-keys a', 'Apps')

--------------------- Windows ---------------------
bindm('Q', hl.dsp.window.close(), 'Close Current Window')
bindm('SHIFT + F', hl.dsp.window.float { action = 'toggle' }, 'Toggle Floating')

bindm('F', function()
  local window = hl.get_active_window()
  if not window then
    return
  end

  if window.floating then
    hl.dispatch(hl.dsp.window.cycle_next { next = true, floating = false, tiling = true })
  else
    hl.dispatch(hl.dsp.window.cycle_next { next = true, floating = true, tiling = false })
  end
end, 'Toggle Floating')

bindm('M', function()
  local window = hl.get_active_window()
  if not window then
    return
  end

  if window.fullscreen and window.fullscreen ~= 0 then
    -- A plain 'unset' silently no-ops on a window whose fullscreen was
    -- client-requested (fullscreenClient ~= 0, e.g. Ghostty's own
    -- fullscreen) rather than compositor-driven — re-asserting a
    -- different mode first overrides the client's request so unset
    -- actually takes effect.
    hl.dispatch(hl.dsp.window.fullscreen { action = 'set', mode = 'fullscreen' })
    hl.dispatch(hl.dsp.window.fullscreen { action = 'unset' })
  else
    hl.dispatch(hl.dsp.window.fullscreen { action = 'set', mode = 'maximized' })
  end
end, 'Toggle Maximize')
bindm('P', function()
  local window = hl.get_active_window()
  if not window then
    return
  end

  if not window.floating then
    hl.dispatch(hl.dsp.window.float { action = 'set' })
  end

  hl.dispatch(hl.dsp.window.pin())
end, 'Pin Window')
bindm('tab', hl.dsp.focus { last = true }, 'Focus Current or Last Window')

local directions = {
  left = { 'LEFT', 'H' },
  right = { 'RIGHT', 'L' },
  up = { 'UP', 'K' },
  down = { 'DOWN', 'J' },
}

for dir, keys in pairs(directions) do
  for _, key in ipairs(keys) do
    bindm(key, function()
      local workspace = hl.get_active_workspace()

      if workspace ~= nil and workspace.tiled_layout == 'scrolling' and (dir == 'left' or dir == 'right') then
        hl.dispatch(hl.dsp.layout('focus ' .. (dir == 'left' and 'l' or 'r')))
      else
        hl.dispatch(hl.dsp.focus { direction = dir })
      end
    end, 'Focus ' .. dir .. ' window')
    bindm('SHIFT + ' .. key, function()
      local workspace = hl.get_active_workspace()

      if workspace ~= nil and workspace.tiled_layout == 'scrolling' and (dir == 'left' or dir == 'right') then
        hl.dispatch(hl.dsp.layout('swapcol ' .. (dir == 'left' and 'l' or 'r')))
      else
        hl.dispatch(hl.dsp.window.move { direction = dir })
      end
    end, 'Move window ' .. dir)
    -- bind('CTRL + ' .. key, hl.dsp.window.move(dir), 'Move window ' .. dir)
  end
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(main_mod .. ' + mouse:272', hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. ' + mouse:273', hl.dsp.window.resize(), { mouse = true })

bindm('R', function()
  hl.dispatch(hl.dsp.submap 'resize')
  hl.dispatch(hl.dsp.exec_cmd "noctalia msg notification-show 'Resize Mode' 'Press ESCAPE to exit'")
end, 'Resize Submap')

define_submap('resize', function()
  bind('C', hl.dsp.layout 'colresize +conf', 'Resize Column')
  submap_bind('M', hl.dsp.layout 'colresize 1', 'Maximize Column')
  hl.bind('LEFT', hl.dsp.window.resize { x = -20, y = 0, relative = true }, { description = 'Resize Left', repeating = true })
  hl.bind('RIGHT', hl.dsp.window.resize { x = 20, y = 0, relative = true }, { description = 'Resize Right', repeating = true })
  hl.bind('UP', hl.dsp.window.resize { x = 0, y = -20, relative = true }, { description = 'Resize Up', repeating = true })
  hl.bind('DOWN', hl.dsp.window.resize { x = 0, y = 20, relative = true }, { description = 'Resize Down', repeating = true })
  hl.bind('H', hl.dsp.window.resize { x = -20, y = 0, relative = true }, { description = 'Resize Left', repeating = true })
  hl.bind('L', hl.dsp.window.resize { x = 20, y = 0, relative = true }, { description = 'Resize Right', repeating = true })
  hl.bind('K', hl.dsp.window.resize { x = 0, y = -20, relative = true }, { description = 'Resize Up', repeating = true })
  hl.bind('J', hl.dsp.window.resize { x = 0, y = 20, relative = true }, { description = 'Resize Down', repeating = true })
end)

--------------------- Workspaces ---------------------
for i = 1, 10 do
  local key = i % 10 -- 10 maps to key 0
  bindm(key, hl.dsp.focus { workspace = i }, 'Focus Workspace ' .. i)
  bindm('SHIFT + ' .. key, hl.dsp.window.move { workspace = i }, 'Move Window to Workspace ' .. i)
end

bindm('S', hl.dsp.workspace.toggle_special 'magic', 'Toggle Special Workspace')
bindm('SHIFT + S', hl.dsp.window.move { workspace = 'special:magic' }, 'Move Window to Special Workspace')

--------------------- Monitors ---------------------
bindm('PERIOD', hl.dsp.focus { monitor = '+1' }, 'Focus Next Monitor')
bindm('COMMA', hl.dsp.focus { monitor = '-1' }, 'Focus Previous Monitor')

bindm('SHIFT + PERIOD', hl.dsp.window.move { monitor = '+1', follow = true }, 'Move Window to Next Monitor')
bindm('SHIFT + COMMA', hl.dsp.window.move { monitor = '-1', follow = true }, 'Move Window to Previous Monitor')

bindm('CTRL + PERIOD', hl.dsp.workspace.move { monitor = '+1' }, 'Move Workspace to Next Monitor')
bindm('CTRL + COMMA', hl.dsp.workspace.move { monitor = '-1' }, 'Move Workspace to Previous Monitor')

--------------------- Notifications ---------------------
bindm('N', exec 'wlr-which-key --initial-keys n', 'Notifications')

--------------------- Media ---------------------
-- Laptop multimedia keys for volume and LCD brightness
hl.bind('XF86AudioRaiseVolume', system_action 'volume up', { locked = true, repeating = true })
hl.bind('XF86AudioLowerVolume', system_action 'volume down', { locked = true, repeating = true })
hl.bind('XF86AudioMute', system_action 'volume mute', { locked = true, repeating = true })
hl.bind('XF86AudioMicMute', system_action 'mic mute', { locked = true, repeating = true })
hl.bind('XF86MonBrightnessUp', system_action 'brightness up', { locked = true, repeating = true })
hl.bind('XF86MonBrightnessDown', system_action 'brightness down', { locked = true, repeating = true })

hl.bind('XF86AudioNext', system_action 'media next', { locked = true })
hl.bind('XF86AudioPause', system_action 'media toggle', { locked = true })
hl.bind('XF86AudioPlay', system_action 'media toggle', { locked = true })
hl.bind('XF86AudioPrev', system_action 'media previous', { locked = true })
