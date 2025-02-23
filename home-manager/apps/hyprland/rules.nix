{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "opacity 0.85 0.85,class:^(kitty)$"
      "opacity 0.85 0.85,class:^(Thunar)$"
      "opacity 0.85 0.85,class:^(thunar)$"
      "opacity 0.95 0.95,class:^(Code)$"
      "opacity 0.97 0.97,class:^(firefox)$"
    ];

    windowrule = [
      "float, ^(qimgv)$"
      "center, ^(qimgv)$"
      "size >50%, ^(qimgv)"
      "float, ^(org.gnome.FileRoller)$"
    ];
  };
}
