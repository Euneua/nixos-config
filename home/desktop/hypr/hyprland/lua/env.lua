-- env.lua
-- Environment variables for the Hyprland session.
-- Set before any application launches.

-- ── Wayland ───────────────────────────────────────────────────────────────────
hl.env("NIXOS_OZONE_WL", "1")                  -- Wayland-native mode for Chromium/Electron
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto") -- Prevent flickering in Electron/CEF apps

-- ── Cursor ────────────────────────────────────────────────────────────────────
hl.env("XCURSOR_SIZE",  "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

-- ── Nvidia ────────────────────────────────────────────────────────────────────
hl.env("LIBVA_DRIVER_NAME",         "nvidia") -- VAAPI driver for hardware video decoding
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia") -- Force GLX Nvidia vendor library
