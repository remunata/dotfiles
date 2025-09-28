{ inputs, pkgs, ... }:
{
  # Hyprland.
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  # Dependencies.
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    libsForQt5.qt5.qtgraphicaleffects
    inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
  ];

  # Thunar file manager.
  programs = {
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    xfconf.enable = true;
  };

  # Thunar functionalities.
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
