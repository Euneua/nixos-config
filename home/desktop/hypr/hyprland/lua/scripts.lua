-- scripts.lua
-- Event-driven Lua scripts using hl.on()
-- Reactive logic that responds to compositor events.

-- ── Window focus notification ──────────────────────────────────────────────────
-- Uncomment to show a notification on window focus change:
-- hl.on("window.active", function(w)
--   hl.notification.create({
--     text    = w.title,
--     timeout = 2000,
--     icon    = "ok",
--   })
-- end)

-- ── Workspace events ──────────────────────────────────────────────────────────
-- hl.on("workspace.active", function(ws)
--   -- Do something on workspace switch
-- end)
