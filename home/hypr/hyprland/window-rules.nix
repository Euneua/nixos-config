# hyprland/window-rules.nix
# Per-application window rules for Hyprland.
# Uses the new windowrule object syntax introduced in Hyprland 0.46.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      {
        # Ignore maximize requests from all applications
        # Hyprland handles layout – apps should not be able to force maximize
        name           = "suppress-maximize-events";
        "match:class"  = ".*";
        suppress_event = "maximize";
      }
      {
        # Fix dragging issues with XWayland popups and tooltips
        # Unfocusable floating XWayland windows without a class can block input
        name               = "fix-xwayland-drags";
        "match:class"      = "^$";
        "match:title"      = "^$";
        "match:xwayland"   = true;
        "match:float"      = true;
        "match:fullscreen" = false;
        "match:pin"        = false;
        no_focus           = true;
      }
      {
        # Float hyprland-run windows and position them at the bottom of the screen
        name          = "move-hyprland-run";
        "match:class" = "hyprland-run";
        move          = "20 monitor_h-120";
        float         = true;
      }
    ];
  };
}
