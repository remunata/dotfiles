{
  pkgs,
  ...
}:
{
  imports = [
    ./apps/btop
    ./apps/caelestia.nix
    ./apps/foot.nix
    ./apps/git.nix
    ./apps/hyprland
    ./apps/sh.nix
    ./apps/spicetify.nix
    ./apps/uwsm
    ./apps/vscodium.nix
    ./apps/wezterm.nix
    ./apps/xdm
    ./apps/zen.nix
    ./theme.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    username = "remunata";
    homeDirectory = "/home/remunata";
    packages = with pkgs; [
      btop
      disfetch
      libreoffice
      zotero
      qbittorrent
      prismlauncher
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Automatic user specific garbage collection every 30d.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
