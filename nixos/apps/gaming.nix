{ pkgs, ... }:
{
  programs = {
    steam.enable = true;
    gamemode.enable = true;
  };

  environment.systemPackages = with pkgs; [
    heroic
    mangohud
    linuxPackages.xone
  ];
}
