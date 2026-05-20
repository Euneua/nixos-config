-- appearance/general.lua

local c = require("colors")

hl.config({
  general = {
    gaps_in     = 4,
    gaps_out    = 8,
    border_size = 1,

    col = {
      active_border   = {
        colors = { c.rgba(c.accent_subtle, "ff"), c.rgba(c.accent, "ff") },
        angle  = 45,
      },
      inactive_border = c.rgba(c.border_inactive, "55"),
    },

    allow_tearing = false,
    layout        = "dwindle",
  },
})
