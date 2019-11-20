# This file has been generated by node2nix 1.7.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {};
in
{
  node-gyp-build = nodeEnv.buildNodePackage {
    name = "node-gyp-build";
    packageName = "node-gyp-build";
    version = "4.2.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.2.0.tgz";
      sha512 = "4oiumOLhCDU9Rronz8PZ5S4IvT39H5+JEv/hps9V8s7RSLhsac0TCP78ulnHXOo8X1wdpPiTayGlM1jr4IbnaQ==";
    };
    buildInputs = globalBuildInputs;
    meta = {
      description = "Build tool and bindings loader for node-gyp that supports prebuilds";
      homepage = https://github.com/prebuild/node-gyp-build;
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}