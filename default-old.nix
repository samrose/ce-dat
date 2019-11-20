{ pkgs ? import ./pkgs.nix {} }:

with pkgs;

{
  ce-dat = stdenv.mkDerivation rec {
    name = "ce-dat";
    src = ./;

    nativeBuildInputs = with buildPackages; [
      nodejs-12_x
    ];

    dat = ./src;

    preConfigure = ''
      cp -r ${npmToNix { inherit src; }} node_modules
      chmod -R +w node_modules
      chmod +x node_modules/.bin/webpack
      patchShebangs node_modules
      cp -r ${npmToNix { src = dat; }} dat/node_modules
      chmod -R +w dat/node_modules
      chmod +x dat/node_modules/.bin/webpack
      chmod +x dat/node_modules/.bin/tsc
      patchShebangs dat/node_modules
    '';

    buildPhase = ''
      cd comb && npm run build
      cd .. && npm run build
    '';

    installPhase = ''
      mkdir $out
      mv dist/* $out
    '';

  };
}
