# hyprlock/hyprlock.nix
# Hyprlock screen lock configuration.
# Displays a blurred wallpaper with a centered clock, date and password input field.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../../colors.nix;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true; # No loading bar on lock
        hide_cursor         = true; # Hide cursor while locked
        grace               = 0;    # No grace period – lock immediately
      };

      # ── Background ──────────────────────────────────────────────────────────
      background = [
        {
          path        = "~/Pictures/wallpapers/wallpaper.jpg";
          blur_passes = 3;   # Number of blur passes (higher = more blur)
          blur_size   = 7;   # Blur kernel size
          brightness  = 0.6; # Dim the wallpaper while locked
        }
      ];

      # ── Password Input Field ────────────────────────────────────────────────
      input-field = [
        {
          size             = "300, 50";
          position         = "0, -80"; # Below center
          halign           = "center";
          valign           = "center";
          outer_color      = "rgba(${colors.blue-rgb}, 0.5)";
          inner_color      = "rgba(${colors.base-rgb}, 0.9)";
          font_color       = "rgb(${colors.text-rgb})";
          fade_on_empty    = true; # Hide the input field when empty
          placeholder_text = "Password...";
          check_color      = "rgba(${colors.mauve-rgb}, 1)";  # Color while checking password
          fail_color       = "rgba(${colors.red-rgb}, 1)";    # Color on wrong password
          fail_text        = "Wrong password";
          capslock_color   = "rgba(${colors.yellow-rgb}, 1)"; # Indicator when Caps Lock is on
          rounding         = 12;
        }
      ];

      # ── Labels ──────────────────────────────────────────────────────────────
      label = [
        {
          # Clock – updates every second
          text        = "cmd[update:1000] echo \"$(date +\"%H:%M\")\"";
          color       = "rgba(${colors.text-rgb}, 1)";
          font_size   = 72;
          font_family = "JetBrainsMono Nerd Font";
          position    = "0, 80"; # Above center
          halign      = "center";
          valign      = "center";
        }
        {
          # Date – updates every second
          text        = "cmd[update:1000] echo \"$(date +\"%A, %d. %B %Y\")\"";
          color       = "rgba(${colors.mauve-rgb}, 0.8)";
          font_size   = 18;
          font_family = "JetBrainsMono Nerd Font";
          position    = "0, 10"; # Just below the clock
          halign      = "center";
          valign      = "center";
        }
      ];
    };
  };
}
