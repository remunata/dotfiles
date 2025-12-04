{
  lib,
  pkgs,
  stdenv,
  autoPatchelfHook,
  makeWrapper,
  zlib,
  glib,
  gtk3,
  fontconfig,
  freetype,
  alsa-lib,
  libappindicator-gtk3,
  copyDesktopItems,
  makeDesktopItem,
  ...
}:

stdenv.mkDerivation rec {
  pname = "ab-download-manager";
  version = "1.7.1";

  src = pkgs.fetchurl {
    url = "https://github.com/amir1376/ab-download-manager/releases/download/v${version}/ABDownloadManager_${version}_linux_x64.tar.gz";
    hash = "sha256-JTW5wTGzfSHAnpi3h21Q485I7noaKjwrY4M8HgDkhTQ=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    copyDesktopItems
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    zlib
    glib
    gtk3
    fontconfig
    freetype
    alsa-lib
    libappindicator-gtk3
    pkgs.xorg.libXtst
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    mkdir -p $out/share/${pname}
    cp -r . $out/share/${pname}

    makeWrapper $out/share/${pname}/bin/ABDownloadManager $out/bin/${pname} \
      --prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath buildInputs} \
      --prefix LD_LIBRARY_PATH : $out/share/${pname}/lib

    install -Dm644 lib/ABDownloadManager.png $out/share/icons/hicolor/512x512/apps/${pname}.png

    runHook postInstall
  '';

  desktopItems = [
    (makeDesktopItem {
      name = pname;
      desktopName = "AB Download Manager";
      exec = "${pname} %U";
      icon = pname;
      comment = "A Download Manager that speeds up your downloads";
      categories = [
        "Network"
        "FileTransfer"
      ];
    })
  ];

  meta = with lib; {
    description = "A Download Manager that speeds up your downloads";
    homepage = "https://abdownloadmanager.com";
    license = licenses.asl20;
    platforms = platforms.linux;
    mainProgram = pname;
  };
}
