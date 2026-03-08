# hyprland/variables.nix
# General appearance settings for Hyprland.
# Includes gaps, borders, decorations and animations.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../../colors.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in    = 3;
      gaps_out   = 6;
      border_size = 1;
      # Active border: blue-to-mauve gradient at 45 degrees
      "col.active_border"   = "rgba(${colors.blue}ff) rgba(${colors.mauve}ff) 45deg";
      # Inactive border: base color with slight transparency
      "col.inactive_border" = "rgba(${colors.crust}88)";
      allow_tearing = false;
      layout        = "dwindle";
    };

    decoration = {
      rounding       = 8;
      rounding_power = 2;

      shadow = {
        enabled      = true;
        range        = 8;
        render_power = 3;
        color        = "rgba(00000066)";
      };

      blur = {
        enabled = false; # Blur disabled for performance (enabled per-layer in layer-rules.nix)
      };
    };

    animations = {
      enabled = true;

      # ── Bezier Curves ────────────────────────────────────────────────────────
      bezier = [
        "linear,          0,    0,    1,    1"
        "almostLinear,    0.5,  0.5,  0.75, 1"
        "quick,           0.15, 0,    0.1,  1"
        "easeInOutCubic,  0.65, 0,    0.35, 1"
        "easeOutQuint,    0.22, 1,    0.36, 1"
        "easeOutExpo,     0.16, 1,    0.3,  1"
        "easeInOutExpo,   0.87, 0,    0.13, 1"
        "easeOutBack,     0.34, 1.56, 0.64, 1" # Slight overshoot – used for window close
      ];

      # ── Animations ──────────────────────────────────────────────────────────
      animation = [
        "global,        1, 4, easeOutQuint"
        "border,        1, 8, linear"
        "windows,       1, 5, easeOutQuint,   slide"
        "windowsIn,     1, 5, easeOutQuint,   slide"
        "windowsOut,    1, 4, easeOutBack,    popin 80%"  # Slight pop on close
        "fade,          1, 5, easeInOutCubic"
        "fadeIn,        1, 5, almostLinear"
        "fadeOut,       1, 4, almostLinear"
        "layers,        1, 4, easeOutQuint,   slide"
        "layersIn,      1, 4, easeOutQuint,   slide"
        "layersOut,     1, 3, easeInOutCubic, fade"
        "fadeLayersIn,  1, 4, almostLinear"
        "fadeLayersOut, 1, 3, almostLinear"
        "workspaces,    1, 5, easeInOutCubic, slide"
        "workspacesIn,  1, 5, easeInOutCubic, slide"
        "workspacesOut, 1, 4, easeInOutCubic, slide"
        "zoomFactor,    1, 5, easeOutQuint"
      ];
    };
  };
}
