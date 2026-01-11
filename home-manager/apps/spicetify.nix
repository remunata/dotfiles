{
  inputs,
  lib,
  system,
  ...
}:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  # Allow unfree spotify package.
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      beautifulLyrics
    ];
    theme = spicePkgs.themes.text;
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      reddit
    ];
  };
}
