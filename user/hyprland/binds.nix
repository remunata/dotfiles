{ ... }:
let
  workspaces = builtins.concatLists (builtins.genList (i:
    let ws = i + 1;
    in [
      "$mod, code:1${toString i}, workspace, ${toString ws}"
      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    ])9);
in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, Q, killactive,"
      "$mod, F, fullscreen,"

      "$mod, Return, exec, kitty"
      "$mod, W, exec, firefox"
    ]
    ++ workspaces;

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
