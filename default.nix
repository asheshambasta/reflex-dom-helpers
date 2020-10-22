{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  rp = import sources.reflex-platform { inherit system; };
in rp.project ({ pkgs, ... }: {
  useWarp = true;
  withHoogle = false;
  packages = { reflex-dom-helpers = ./.; };
  shells = {
    ghc = [ "reflex-dom-helpers" ];
    ghcjs = [ "reflex-dom-helpers" ];
  };
})
