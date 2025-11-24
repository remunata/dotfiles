{ pkgs, ... }:
{
  boot = {
    loader.grub.theme = pkgs.stdenv.mkDerivation {
      pname = "star-rail-grub-theme";
      version = "20250815-102435";
      src = pkgs.fetchFromGitHub {
        owner = "MrVivekRajan";
        repo = "Grub-Themes";
        rev = "cefbbf6a13b9bb3405c66219a5b4ead5d4f31fca";
        hash = "sha256-Z/FmySvFZW11Qv6mfMGZHbHLc8hmz2hhDQFaxb+1OHU=";
      };

      installPhase = ''
        mkdir -p $out
        cp -r ./SekiroShadow/* $out/
      '';
    };
  };
}
