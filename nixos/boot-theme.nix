{ pkgs, ... }:
let
  grub-theme = "TheHerta";
  plymouth-theme = "circle_hud";
in

{
  boot = {
    loader.grub.theme = pkgs.stdenv.mkDerivation {
      pname = "star-rail-grub-theme";
      version = "20250815-102435";
      src = pkgs.fetchFromGitHub {
        owner = "voidlhf";
        repo = "StarRailGrubThemes";
        rev = "v20250815-102435";
        hash = "sha256-XqPvbwtSDF6rCPxP3Cv+BSY9Nx8c0aXrhAk7OE7xhC8=";
      };

      installPhase = ''
        mkdir -p $out
        cp -r ./assets/themes/${grub-theme}/* $out/
      '';
    };
  };
}
