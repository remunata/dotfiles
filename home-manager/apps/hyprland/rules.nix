{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "opacity 0.85 0.85,class:^(kitty)$"
      "opacity 0.85 0.85,class:^(Thunar)$"
      "opacity 0.85 0.85,class:^(thunar)$"
      "opacity 0.95 0.95,class:^(Code)$"
      "opacity 0.97 0.97,class:^(zen-twilight)$"
    ];

    windowrule = [
      "float, class:qimgv"
      "center, class:qimgv"
      "size >50%, class:qimgv"
      "float, class:org.gnome.FileRoller"
      "float, title:(File Operation Progress)"
    ];
  };
}
