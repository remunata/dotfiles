{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "lxqt-policykit-agent"
      "waybar"
      "hyprctl setcursor Bibata-Modern-Classic 20"
    ];

    env = [
      "XDG_CURRENT_DESKTOP,Hyprland"
      "XDG_SESSION_TYPE,wayland"
      "XDG_SESSION_DESKTOP,Hyprland"
    ];

    monitor = [
      "eDP-1, 1920x1080@60, 0x0, 1"
    ];

    general = {
      resize_on_border = true;
      layout = "dwindle";

      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;

      "col.active_border" = "rgba(d627c8ff) rgba(0553fcff) 45deg";
      "col.inactive_border" = "rgba(595959aa)";
    };

    misc = {
      disable_hyprland_qtutils_check = true;
    };

    cursor = {
      no_hardware_cursors = true;
    };

    dwindle = {
      preserve_split = true;
      pseudotile = true;
      smart_split = false;
      smart_resizing = false;
    };

    decoration = {
      rounding = 8;
      dim_special = 0.7;
      blur = {
        enabled = true;
        special = true;
        new_optimizations = true;
        size = 4;
        passes = 1;
        vibrancy = 0.1696;
      };
    };

    animations = {
      enabled = true;
      bezier = "overshoot, 0.05, 0.9, 0.1, 1.1";

      animation = [
        "windowsIn, 1, 4, overshoot, popin 90%"
        "windowsOut, 1, 4, overshoot, popin 90%"
        "windowsMove, 1, 3, overshoot"
        "border, 1, 5, default"
        "borderangle, 1, 8, default"
        "layersIn, 1, 1, default, popin 90%"
        "layersOut, 1, 1, default, popin 90%"
        "fade, 1, 7, default"
        "workspaces, 1, 4, default, slide"
        "specialWorkspace, 1, 3, default, slide"
      ];
    };
  };
}
