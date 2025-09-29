{ pkgs, ... }:
{
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
