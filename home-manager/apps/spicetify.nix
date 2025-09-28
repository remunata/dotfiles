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

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      beautifulLyrics
    ];
    theme = spicePkgs.themes.orchis;
  };

  # Allow unfree spotify package.
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "spotify"
    ];
}
