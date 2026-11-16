# Mugetsu for Nix

- [Support](#about)
- [Limits](#limits)
- [Testing](#testing)
- [Install](#install)

## About

Mugetsu is an open source Ruffle fork for AQWorlds. Only Linux x86_64 is currently supported.

## Limits

Toggling graphics while running is as of now not possible. If you need OpenGL, pass the **-g gl** flag on command line.

## Testing

This one-liner of Nix can run Mugetsu before install:

```sh
nix run github:notawyvern/mugetsu-nix#mugetsu
```

## Install

```nix
inputs = {
    mugetsu-nix.url = "github:notawyvern/mugetsu-nix";
    mugetsu-nix.inputs.nixpkgs.follows = "nixpkgs";
};
```

```nix
enviroment.systemPackages = [
    inputs.mugetsu-nix.packages.${pkgs.stdenv.hostPlatform.system}.mugetsu
];
```