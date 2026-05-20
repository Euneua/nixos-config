-- appearance/decoration.lua

local c = require("colors")

hl.config({
  decoration = {
    rounding       = 8,
    rounding_power = 2,

    active_opacity   = 1.0,
    inactive_opacity = 1,0, 

    shadow = {
      enabled      = true,
      range        = 12,
      render_power = 3,
      color        = c.hex(c.bg_dark),
    },

    blur = {
      enabled = false, -- Enabled selectively in rules/layer-rules.lua
    },
  },
})
