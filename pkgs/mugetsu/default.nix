{
  fetchurl,
  stdenvNoCC,
  stdenv,
  autoPatchelfHook,
  fontconfig,
  vulkan-loader,
  libGL,
  zlib,
  openssl,
  alsa-lib,
  udev,
  libxkbcommon,
  wayland,
  ...
}:

let
  version = "1.6.0";
  pname = "Mugetsu";
in
stdenvNoCC.mkDerivation {
  inherit version pname;

  src = fetchurl {
    url = "https://github.com/mugetsu-aqw/mugetsu/releases/download/v${version}/Mugetsu-${version}-linux.tar.gz";
    hash = "sha256-+AdIknU0/Opv5IP+RVyOBbshXu4RpEXstayIRWqZXvU=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    fontconfig
    zlib
    openssl
    alsa-lib
    udev
  ];

  runtimeDependencies = [
    libxkbcommon
    wayland
    libGL
    vulkan-loader
  ];

  installPhase = ''
    tar -xzf $src
    install -d $out/bin
    cp -r Mugetsu/LICENSES $out/
    install -m755 Mugetsu/Mugetsu $out/bin/
  '';

  dontBuild = true;
}
