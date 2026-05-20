-- binds/submaps.lua

local mod = "SUPER"

-- ── Resize ────────────────────────────────────────────────────────────────────
hl.bind(mod .. " + CTRL + h", function() hl.dispatch(hl.dsp.window.resize({ x = -50, y =   0 })) end, { repeating = true })
hl.bind(mod .. " + CTRL + l", function() hl.dispatch(hl.dsp.window.resize({ x =  50, y =   0 })) end, { repeating = true })
hl.bind(mod .. " + CTRL + k", function() hl.dispatch(hl.dsp.window.resize({ x =   0, y = -50 })) end, { repeating = true })
hl.bind(mod .. " + CTRL + j", function() hl.dispatch(hl.dsp.window.resize({ x =   0, y =  50 })) end, { repeating = true })

