# home/apps/ghostty.nix
{ config, pkgs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;
in
{
  programs.ghostty = {
    enable = true;
    settings = {
      font-family  = "JetBrainsMono Nerd Font";
      font-size    = 13;
      font-feature = "+liga +calt";

      window-padding-x       = 12;
      window-padding-y       = 12;
      window-decoration      = false;
      background-opacity     = 0.92;
      background-blur-radius = 20;

      cursor-style       = "bar";
      cursor-style-blink = false;

      scrollback-limit = 10000;

      background = r.bg;
      foreground = r.text;

      palette = [
        "0=#${colors.overlay0}"    # black
        "1=#${r.error}"            # red
        "2=#${r.success}"          # green
        "3=#${r.caution}"          # yellow
        "4=#${r.link}"             # blue
        "5=#${r.accent}"           # magenta
        "6=#${r.info}"             # cyan
        "7=#${r.text}"             # white
        "8=#${colors.surface2}"    # bright-black
        "9=#${colors.extra2}"      # bright-red
        "10=#${colors.info2}"      # bright-green
        "11=#${colors.accent_b}"   # bright-yellow
        "12=#${colors.accent}"     # bright-blue
        "13=#${colors.extra3}"     # bright-magenta
        "14=#${colors.link2}"      # bright-cyan
        "15=#${r.text}"            # bright-white
      ];

      selection-background = r.accent;
      selection-foreground = r.bg;
    };
  };
}
