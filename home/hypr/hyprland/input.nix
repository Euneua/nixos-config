# hyprland/input.nix
# Keyboard, mouse and touchpad input configuration.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    input = {
      # ── Keyboard ────────────────────────────────────────────────────────────
      kb_layout  = "de";
      kb_variant = "";
      kb_model   = "";
      kb_options = "";
      kb_rules   = "";

      # ── Mouse ────────────────────────────────────────────────────────────────
      follow_mouse   = 1;    # Focus follows mouse movement
      mouse_refocus  = true; # Re-focus window when mouse enters it
      focus_on_close = 1;    # Focus the window under the cursor when a window is closed
      sensitivity    = 0;    # Mouse sensitivity – 0 = no modification (-1.0 to 1.0)
      accel_profile  = "flat"; # Disable mouse acceleration

      # ── Touchpad ────────────────────────────────────────────────────────────
      touchpad = {
        natural_scroll          = true;  # Reverse scroll direction (macOS-style)
        tap-to-click            = true;  # Tap to click
        tap-and-drag            = true;  # Tap and hold to drag
        drag_lock               = false; # Release finger without dropping drag
        disable_while_typing    = true;  # Disable touchpad while typing
        scroll_factor           = 1;     # Scroll speed multiplier
        middle_button_emulation = false; # No middle click emulation
      };
    };
  };
}
