{ pkgs, ... }:
let
  workspaces = builtins.concatLists (builtins.genList (i:
    let ws = i + 1;
    in [
      "$mod, code:1${toString i}, workspace, ${toString ws}"
      "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
    ])9);

  playerctl = "${pkgs.playerctl}/bin/playerctl";
  brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";
  volumectl = builtins.path {
    path = ./scripts/volumecontrol.sh;
  };

in {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    bind = [
      "$mod, Return, exec, kitty"
      "$mod, W, exec, firefox"
      "$mod, E, exec, thunar"

      "ALT, Space, exec, rofi -show drun"
      "$mod, Backspace, exec, wlogout"
      "$mod Shift, S, exec, grimblast --notify --freeze copysave area"
      ", Print, exec, grimblast --notify copysave screen"

      "$mod, Q, killactive,"
      "$mod, F, fullscreen, 1"
      "$mod Shift, F, fullscreen, 0"
      "$mod, Space, toggleFloating,"
      "$mod, P, togglesplit,"
      "ALT, Tab, cyclenext,"
      "ALT, Tab, bringactivetotop"

      "$mod, Left, movefocus, l"
      "$mod, Right, movefocus, r"
      "$mod, Up, movefocus, u"
      "$mod, Down, movefocus, d"
      "$mod, BracketLeft, movefocus, l"
      "$mod, BracketRight, movefocus, r"
      "$mod Shift, Left, movewindow, l"
      "$mod Shift, Right, movewindow, r"
      "$mod Shift, Up, movewindow, u"
      "$mod Shift, Down, movewindow, d"

      "$mod Ctrl, Left, workspace, -1"
      "$mod Ctrl, Right, workspace, +1"
      "$mod, mouse_up, workspace, +1"
      "$mod, mouse_down, workspace, -1"
      "$mod Ctrl, mouse_up, workspace, +1"
      "$mod Ctrl, mouse_down, workspace, -1"

      "$mod, S, togglespecialworkspace,"
      "$mod ALT, S, movetoworkspacesilent, special"
    ]
    ++ workspaces;

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindle = [
      ",XF86MonBrightnessUp,   exec, ${brightnessctl} set +5%"
      ",XF86MonBrightnessDown, exec, ${brightnessctl} set  5%-"
      ",XF86AudioRaiseVolume,  exec, ${volumectl} i"
      ",XF86AudioLowerVolume,  exec, ${volumectl} d"
    ];

    bindl = [
      ",XF86AudioPlay,    exec, ${playerctl} play-pause"
      ",XF86AudioStop,    exec, ${playerctl} pause"
      ",XF86AudioPause,   exec, ${playerctl} pause"
      ",XF86AudioPrev,    exec, ${playerctl} previous"
      ",XF86AudioNext,    exec, ${playerctl} next"
    ];

    binde = [
      "$mod, Semicolon, splitratio, -0.1"
      "$mod, Apostrophe, splitratio, +0.1"
    ];
  };
}
