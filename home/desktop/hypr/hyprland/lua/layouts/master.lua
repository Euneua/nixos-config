-- layouts/master.lua

hl.config({
  master = {
    new_status     = "slave",  -- New windows open as slaves
    new_on_top     = false,    -- New slaves appear at the bottom
    mfact          = 0.55,     -- Master takes 55% of screen width
    orientation    = "left",   -- Master on the left
    smart_resizing = true,     -- Resize both sides proportionally
    drop_at_cursor = true,     -- Drag and drop at cursor position
  },
})
