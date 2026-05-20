-- monitors.lua
-- Monitor layout and scaling configuration.

hl.monitor({
  output   = "eDP-1",
  mode     = "modeline 348.16 2560 2752 3032 3504 1600 1601 1604 1656 -HSync +Vsync",
  position = "auto",
  scale    = 1.6,
})

-- ── External monitors ─────────────────────────────────────────────────────────
-- hl.monitor({
--   output   = "HDMI-A-1",
--   mode     = "preferred",
--   position = "auto",
--   scale    = 1.0,
-- })
