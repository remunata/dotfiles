{
  users.users.remunata = {
    isNormalUser = true;
    description = "remunata";
    extraGroups = [ "networkmanager" "wheel" "input" ];
  };

  nix.extraOptions = ''
    trusted-users = root remunata
  '';
}
