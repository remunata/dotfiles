{ pkgs, ... }:
let
  xdm = builtins.path {
    path = ./xdman.jar;
  };
  icon = builtins.path {
    path = ./icon.png;
  };
in
{
  xdg.desktopEntries.xdm = {
    name = "Xtreme Download Manager";
    type = "Application";
    exec = "${pkgs.jdk11}/bin/java -jar ${xdm}";
    icon = "${icon}";
    terminal = false;
  };
}
