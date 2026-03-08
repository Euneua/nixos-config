# ghostty/ghostty.nix
# Ghostty terminal emulator configuration.
# Uses JetBrainsMono Nerd Font with ligatures and a transparent background.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      # ── Font ────────────────────────────────────────────────────────────────
      font-family  = "JetBrainsMono Nerd Font";
      font-size    = 13;
      font-feature = "+liga +calt"; # Enable ligatures and contextual alternates

      # ── Window ──────────────────────────────────────────────────────────────
      window-padding-x       = 12;
      window-padding-y       = 12;
      window-decoration      = false; # No client-side decorations (Hyprland handles borders)
      background-opacity     = 0.92;
      background-blur-radius = 20;

      # ── Cursor ──────────────────────────────────────────────────────────────
      cursor-style       = "bar";
      cursor-style-blink = false;

      # ── Shell ───────────────────────────────────────────────────────────────
      scrollback-limit = 10000;

      # ── Colors ──────────────────────────────────────────────────────────────
      background = colors.base;
      foreground = colors.text;

      # 16-color terminal palette (0-7 normal, 8-15 bright)
      palette = [
        "0=#${colors.surface0}"  # Black
        "1=#${colors.red}"       # Red
        "2=#${colors.green}"     # Green
        "3=#${colors.yellow}"    # Yellow
        "4=#${colors.blue}"      # Blue
        "5=#${colors.mauve}"     # Magenta
        "6=#${colors.sky}"       # Cyan
        "7=#${colors.text}"      # White
        "8=#${colors.surface1}"  # Bright black
        "9=#${colors.red}"       # Bright red
        "10=#${colors.green}"    # Bright green
        "11=#${colors.yellow}"   # Bright yellow
        "12=#${colors.blue}"     # Bright blue
        "13=#${colors.mauve}"    # Bright magenta
        "14=#${colors.sky}"      # Bright cyan
        "15=#${colors.subtext1}" # Bright white
      ];

      selection-background = colors.mauve;
      selection-foreground = colors.base;
    };
  };
}
