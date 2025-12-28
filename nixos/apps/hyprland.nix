{
  pkgs,
  ...
}:
{
  # Hyprland.
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Dependencies.
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    libsForQt5.qt5.qtgraphicaleffects
  ];
}
