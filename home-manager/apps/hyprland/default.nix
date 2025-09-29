{ ... }:
let
  hl = builtins.path {
    path = ./hyprland;
  };
  variables = builtins.path {
    path = ./variables.conf;
  };
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      "$hypr" = "~/.config/hypr";
      "$cConf" = "~/.config/calestia";

      exec = [
        "cp -L --no-preserve=mode --update=none $hypr/scheme/default.conf $hypr/scheme/current.conf"
        "mkdir -p $cConf && touch -a $cConf/hypr-vars.conf"
        "mkdir -p $cConf && touch -a $cConf/hypr-user.conf"
      ];

      monitor = [
        ", preferred, auto, 1"
      ];

      source = [
        "$hypr/scheme/current.conf"
        "$cConf/hypr-vars.conf"
        "$cConf/hypr-user.conf"
        "${variables}"
        "${hl}/env.conf"
        "${hl}/general.conf"
        "${hl}/input.conf"
        "${hl}/misc.conf"
        "${hl}/animations.conf"
        "${hl}/decoration.conf"
        "${hl}/group.conf"
        "${hl}/execs.conf"
        "${hl}/rules.conf"
        "${hl}/keybinds.conf"
      ];
    };
  };

  home.file = {
    ".config/hypr/scheme/default.conf" = {
      source = ./scheme/default.conf;
    };
    ".config/hypr/scripts" = {
      source = ./scripts;
    };
  };
}
