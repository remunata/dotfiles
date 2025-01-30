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
      python311Packages.mypy
      python311Packages.ruff
      python311Packages.black
      svelte-language-server
      prettierd
    ];
  };
}
