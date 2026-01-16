{
  imports = [
    ./apps/gaming.nix
    ./apps/general.nix
    ./apps/niri.nix
    ./apps/sh.nix
    ./apps/thunar.nix
    ./boot-theme.nix
    ./nvidia.nix
    ./packages.nix
    ./sddm.nix
    ./system.nix
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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
