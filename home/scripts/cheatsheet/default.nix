# home/scripts/cheatsheet/default.nix
# Nix derivation – builds the cheatsheet binary via rustPlatform.

{ pkgs }:

pkgs.rustPlatform.buildRustPackage {
  pname   = "cheatsheet";
  version = "0.1.0";

  src = ./.;

  cargoLock.lockFile = ./Cargo.lock;

  meta = {
    description = "Keybind cheatsheet overlay via Rofi";
    mainProgram = "cheatsheet";
  };
}
