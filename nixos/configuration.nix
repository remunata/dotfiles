{ config, pkgs, ... }:

{
  imports = [
    ./boot-theme.nix
    ./hyprland.nix
    ./nvidia.nix
    ./packages.nix
    ./system.nix
    ./sddm-avatar.nix
    ./user.nix
    ./hardware-configuration.nix
  ];

  # Nix settings.
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = [
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  # Bootloader.
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      useOSProber = true;
    };
  };

  # Support NTFS file system for windows partition.
  boot.supportedFilesystems = [ "ntfs" ];

  # Automatic system specific garbage collection every 30d.
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
