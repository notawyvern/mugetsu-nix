{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate =
          pkg:
          builtins.elem (pkgs.lib.getName pkg) [
            "Mugetsu"
          ];
      };
    in
    {
      packages.${system} = {
        mugetsu = pkgs.callPackage ./pkgs/mugetsu { };
      };
    };
}
