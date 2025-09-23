{
  users.users.remunata = {
    isNormalUser = true;
    description = "remunata";
    extraGroups = [
      "networkmanager"
      "wheel"
      "input"
      "docker"
    ];
  };

  nix.extraOptions = ''
    trusted-users = root remunata
  '';
}
