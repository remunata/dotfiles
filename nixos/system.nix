{
  # Networking configuration.
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    nameservers = [
      "1.1.1.1"
      "9.9.9.9"
    ];
    firewall.enable = true;
  };

  # Timezone.
  time.timeZone = "Asia/Jakarta";

  # Locale.
  i18n.defaultLocale = "en_US.UTF-8";

  # Keyboard layout.
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Security.
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Blacklist sound module for dell laptop.
  boot.blacklistedKernelModules = [ "snd_soc_avs" ];
}
