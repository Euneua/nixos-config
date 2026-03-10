# home/scripts/cheatsheet/default.nix
# Nix derivation – builds the cheatsheet binary via rustPlatform.
# Colors from colors.nix are passed as environment variables at compile time.

{ pkgs }:
let
  colors = import ../../colors.nix;
in
pkgs.rustPlatform.buildRustPackage {
  pname   = "cheatsheet";
  version = "0.1.0";

  src = ./.;

  cargoLock.lockFile = ./Cargo.lock;

  # ── Compile-time color variables ──────────────────────────────────────────
  env = {
    CHEATSHEET_COLOR_HYPRLAND = "#${colors.cheatsheet-hyprland}";
    CHEATSHEET_COLOR_NEOVIM   = "#${colors.cheatsheet-neovim}";
    CHEATSHEET_COLOR_BROWSER  = "#${colors.cheatsheet-browser}";
    CHEATSHEET_COLOR_UNKNOWN  = "#${colors.cheatsheet-unknown}";
  };

  meta = {
    description = "Keybind cheatsheet overlay via Rofi";
    mainProgram = "cheatsheet";
  };
}
