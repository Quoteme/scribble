{
  description =
    "Scribble is a lightweight library for freehand drawing in Flutter supporting pressure, variable line width and more! ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        defaultPackage = packages.scribble;
        packages.scribble = with pkgs;
          mkShell {
            name = "scribble";
            buildInputs = [ flutter ];
            # shellHook = ''
            #   yarn install
            # '';
          };
      });
}
