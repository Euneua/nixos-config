# hyprland/env.nix
# Environment variables for the Hyprland session.
# Set before any application launches to ensure correct runtime behavior.

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    env = [
      # Force Wayland native mode for Chromium-based apps (VS Code, Electron, etc.)
      "NIXOS_OZONE_WL,1"

      # Cursor theme and size (must match autostart.nix setcursor call)
      "XCURSOR_SIZE,24"
      "XCURSOR_THEME,Bibata-Modern-Classic"

      # Nvidia: use the Nvidia VAAPI driver for hardware video decoding
      "LIBVA_DRIVER_NAME,nvidia"
      # Nvidia: force GLX to use the Nvidia vendor library
      "__GLX_VENDOR_LIBRARY_NAME,nvidia"

      # Prevent flickering in Electron / CEF apps on Wayland
      "ELECTRON_OZONE_PLATFORM_HINT,auto"
    ];
  };
}
