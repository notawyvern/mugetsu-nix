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
  version = "2.0.0";
  pname = "Mugetsu";
in
stdenvNoCC.mkDerivation {
  inherit version pname;

  src = fetchurl {
    url = "https://github.com/mugetsu-aqw/mugetsu/releases/download/v${version}/Mugetsu-${version}-linux.tar.gz";
    hash = "sha256-8XsnbtKg7dR+6r34m+JE204ymfhZZrxJ5F6x7X59zcA=";
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
