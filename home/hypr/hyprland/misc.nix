# hyprland/misc.nix
# Miscellaneous Hyprland options.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    misc = {
      force_default_wallpaper      = 0;     # Disable the default Hyprland wallpaper
      disable_hyprland_logo        = true;  # Hide the Hyprland logo on empty workspaces
      disable_splash_rendering     = true;  # Disable the splash text on startup
      font_family                  = "JetBrainsMono Nerd Font"; # Font for Hyprland UI elements
      focus_on_activate            = false; # Don't steal focus when a window requests activation
      animate_mouse_windowdragging = true;  # Animate windows while dragging with the mouse
      vfr                          = true;  # Variable framerate – reduces GPU usage when idle
      vrr                          = 0;     # FreeSync / VRR disabled
      mouse_move_enables_dpms      = true;  # Wake display on mouse movement
      key_press_enables_dpms       = true;  # Wake display on key press
    };
  };
}
