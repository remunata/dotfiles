{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"
    ];

    general = {
      gaps_in = 4;
      gaps_out = 5;
      gaps_workspaces = 50;
      border_size = 1;
      "col.active_border" = "rgba(0DB7D4FF)";
      "col.inactive_border" = "rgba(31313600)";
      resize_on_border = true;
      layout = "dwindle";
    };

    dwindle = {
      preserve_split = true;
      pseudotile = true;
      smart_split = false;
      smart_resizing = false;
    };

    decoration = {
      rounding = 16;
      blur = {
	enabled = true;
	xray = true;
	special = false;
	new_optimizations = true;
	size = 14;
	passes = 4;
	brightness = 1;
	noise = 0.01;
	contrast = 1;
	popups = true;
	popups_ignorealpha = 0.6;
      };

      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_range = 20;
      shadow_offset = "0 2";
      shadow_render_power = 4;
      "col.shadow" = "rgba(0000002A)";
    };

    animations = {
      enabled = true;
      bezier = [
        "linear, 0, 0, 1, 1"
        "md3_standard, 0.2, 0, 0, 1"
        "md3_decel, 0.05, 0.7, 0.1, 1"
        "md3_accel, 0.3, 0, 0.8, 0.15"
        "overshot, 0.05, 0.9, 0.1, 1.1"
        "crazyshot, 0.1, 1.5, 0.76, 0.92"
        "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
        "menu_decel, 0.1, 1, 0, 1"
        "menu_accel, 0.38, 0.04, 1, 0.07"
        "easeInOutCirc, 0.85, 0, 0.15, 1"
        "easeOutCirc, 0, 0.55, 0.45, 1"
        "easeOutExpo, 0.16, 1, 0.3, 1"
        "softAcDecel, 0.26, 0.26, 0.15, 1"
        "md2, 0.4, 0, 0.2, 1"
      ];

      animation = [
        "windows, 1, 3, md3_decel, popin 60%"
        "windowsIn, 1, 3, md3_decel, popin 60%"
        "windowsOut, 1, 3, md3_accel, popin 60%"
        "border, 1, 10, default"
	"fade, 1, 3, md3_decel"
	"layersIn, 1, 3, menu_decel, slide"
	"layersOut, 1, 1.6, menu_accel"
	"fadeLayersIn, 1, 2, menu_decel"
	"fadeLayersOut, 1, 4.5, menu_accel"
	"workspaces, 1, 7, menu_decel, slide"
	"specialWorkspace, 1, 3, md3_decel, slidevert"
      ];
    };
  };
}
