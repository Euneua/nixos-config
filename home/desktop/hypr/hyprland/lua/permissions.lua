-- permissions.lua
-- Controls which applications can access privileged Hyprland features.
-- Requires enforce_permissions = true in general config to take effect.
-- Restart Hyprland after changes – not applied on-the-fly.

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim",                              "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland",  "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm",                           "plugin",     "allow")
