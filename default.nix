# From GitHub: mozilla/nixpkgs-mozilla/default.nix.

self: super:

let

  localLib = import ./lib.nix;

in

with super.lib;

(foldl' (flip extends) (_: super) [
  (import localLib.fetchNixPkgsLibQuixoftic)
  (import localLib.fetchMellon)
  (import localLib.fetchPinPon)
  (import localLib.fetchHpio)
  (import ./overlays/custom-packages.nix)
  (import ./overlays/haskell-packages.nix)
  (import ./overlays/lib.nix)
  (import ./overlays/overrides.nix)
  (import ./overlays/patches.nix)
]) self
