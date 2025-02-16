{ inputs, config, pkgs, ... }:

{
  imports = [
    inputs.nvchad4nix.homeManagerModule
    ./configs.nix
    ./plugins.nix
  ];

  programs.nvchad = {
    enable = true;
    backup = false;
    hm-activation = true;
    extraPackages = with pkgs; [
      rust-analyzer
      vscode-langservers-extracted
      pyright
      python3Packages.mypy
      python3Packages.ruff
      python3Packages.black
    ];
  };
}
