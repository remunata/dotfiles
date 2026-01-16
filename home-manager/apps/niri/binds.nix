{
  programs.niri.settings.binds = {
    "Mod+Shift+Slash" = {
      hotkey-overlay.title = "Show keybind list";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "keybinds"
        "toggle"
        "niri"
      ];
    };

    "Mod+Return" = {
      hotkey-overlay.title = "Open Terminal";
      action.spawn = "wezterm";
    };

    "Mod+E" = {
      hotkey-overlay.title = "Open file manager";
      action.spawn = "thunar";
    };

    "Mod+W" = {
      hotkey-overlay.title = "Open browser";
      action.spawn = "vivaldi";
    };

    "Mod+O" = {
      repeat = false;
      action.toggle-overview = [ ];
    };

    "Mod+Q" = {
      repeat = false;
      action.close-window = [ ];
    };

    # Navigation
    "Mod+Left".action.focus-column-left = [ ];
    "Mod+Right".action.focus-column-right = [ ];
    "Mod+Down".action.focus-window-down = [ ];
    "Mod+Up".action.focus-window-up = [ ];
    "Mod+H".action.focus-column-left = [ ];
    "Mod+L".action.focus-column-right = [ ];
    "Mod+1".action.focus-column-left = [ ];
    "Mod+2".action.focus-column-right = [ ];

    # Move window
    "Mod+Shift+Left".action.move-column-left = [ ];
    "Mod+Shift+Right".action.move-column-right = [ ];
    "Mod+Shift+Down".action.move-window-down = [ ];
    "Mod+Shift+Up".action.move-window-up = [ ];
    "Mod+Shift+H".action.move-column-left = [ ];
    "Mod+Shift+L".action.move-column-right = [ ];
    "Mod+Shift+1".action.move-column-left = [ ];
    "Mod+Shift+2".action.move-column-right = [ ];

    # Workspace navigation
    "Mod+J".action.focus-workspace-down = [ ];
    "Mod+K".action.focus-workspace-up = [ ];
    "Mod+Page_Down".action.focus-workspace-down = [ ];
    "Mod+Page_Up".action.focus-workspace-up = [ ];

    # Move window across workspace
    "Mod+Shift+J".action.move-column-to-workspace-down = [ ];
    "Mod+Shift+K".action.move-column-to-workspace-up = [ ];
    "Mod+Shift+Page_Down".action.move-column-to-workspace-down = [ ];
    "Mod+Shift+Page_Up".action.move-column-to-workspace-up = [ ];

    "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
    "Mod+BracketRight".action.consume-or-expel-window-right = [ ];

    "Mod+R".action.switch-preset-column-width = [ ];
    "Mod+Shift+R".action.switch-preset-window-height = [ ];
    "Mod+F".action.maximize-column = [ ];
    "Mod+Shift+F".action.fullscreen-window = [ ];

    "Mod+Shift+Ctrl+F".action.maximize-window-to-edges = [ ];
    "Mod+Ctrl+F".action.expand-column-to-available-width = [ ];

    "Mod+C".action.center-column = [ ];
    "Mod+Shift+C".action.center-visible-columns = [ ];

    "Mod+Alt+Space".action.toggle-window-floating = [ ];
    "Mod+Shift+Alt+Space".action.switch-focus-between-floating-and-tiling = [ ];

    # Screenshot
    "Print".action.screenshot = [ ];
    "Ctrl+Print".action.screenshot-screen = [ ];
    "Alt+Print".action.screenshot-window = [ ];

    # DMS Binds
    "Mod+Space" = {
      hotkey-overlay.title = "Application Launcher";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "spotlight"
        "toggle"
      ];
    };
    "Mod+V" = {
      hotkey-overlay.title = "Clipboard Manager";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "clipboard"
        "toggle"
      ];
    };
    "Mod+M" = {
      hotkey-overlay.title = "Task Manager";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "processlist"
        "toggle"
      ];
    };
    "Mod+N" = {
      hotkey-overlay.title = "Notification Center";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "notifications"
        "toggle"
      ];
    };
    "Mod+Y" = {
      hotkey-overlay.title = "Browse Wallpapers";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "dankdash"
        "wallpaper"
      ];
    };

    "Mod+Alt+L" = {
      hotkey-overlay.title = "Notification Center";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "lock"
        "lock"
      ];
    };

    "Mod+Backspace" = {
      hotkey-overlay.title = "Power Menu";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "powermenu"
        "toggle"
      ];
    };

    "Mod+Shift+N" = {
      hotkey-overlay.title = "Notepad";
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "notepad"
        "toggle"
      ];
    };

    # Volume control
    "XF86AudioRaiseVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "audio"
        "increment"
        "5"
      ];
    };
    "XF86AudioLowerVolume" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "audio"
        "decrement"
        "5"
      ];
    };
    "XF86AudioMute" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "audio"
        "mute"
      ];
    };

    # Brightness control
    "XF86MonBrightnessUp" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "brightness"
        "increment"
        "5"
        ""
      ];
    };
    "XF86MonBrightnessDown" = {
      allow-when-locked = true;
      action.spawn = [
        "dms"
        "ipc"
        "call"
        "brightness"
        "decrement"
        "5"
        ""
      ];
    };
  };
}
