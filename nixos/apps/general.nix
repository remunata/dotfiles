{
  inputs,
  pkgs,
  system,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    inputs.nvim.packages.${system}.default
    qimgv
    evince
    mpv
    discord
    keepassxc
    postman
    obsidian
  ];
}
