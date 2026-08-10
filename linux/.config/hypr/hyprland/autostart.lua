---@diagnostic disable: undefined-global
hl.on('hyprland.start', function()
  hl.exec_cmd 'gsettings set org.gnome.desktop.interface gtk-theme "adw-gtk3"'
  hl.exec_cmd 'gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"'

  hl.exec_cmd 'sleep 1 && dbus-update-activation-environment --systemd --all'
  hl.exec_cmd 'gnome-keyring-daemon --start --components=secrets'

  hl.exec_cmd 'runapp noctalia'

  if os.getenv 'UWSM_MANAGED' ~= '1' then
    hl.exec_cmd 'udiskie'
    hl.exec_cmd '1password --silent'
    hl.exec_cmd 'vicinae server'
  end
end)
