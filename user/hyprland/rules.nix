{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "opacity 0.8 0.8,class:^(kitty)$"
      "opacity 0.9 0.9,class:^(VSCodium)$"
    ];
  };
}
