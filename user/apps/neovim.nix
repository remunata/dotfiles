{ inputs, config, pkgs, ... }:

{
  imports = [ inputs.nvchad4nix.homeManagerModule ];

  programs.nvchad = {
    enable = true;
    extraPackages = with pkgs; [
      python311Packages.python-lsp-server
    ];

    hm-activation = false;
  };
}
