{
  inputs,
  pkgs,
  system,
  ...
}:
{
  # Hyprland.
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${system}.hyprland;
    portalPackage = inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland;
  };

  # Dependencies.
  environment.systemPackages = with pkgs; [
    lxqt.lxqt-policykit
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
