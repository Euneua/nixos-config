-- input/touchpad.lua

hl.config({
  input = {
    touchpad = {
      natural_scroll          = true,  -- Reverse scroll (macOS-style)
      ["tap-to-click"]        = true,  -- Tap to click
      ["tap-and-drag"]        = true,  -- Tap and hold to drag
      drag_lock               = false, -- Release finger without dropping drag
      disable_while_typing    = true,  -- Disable touchpad while typing
      scroll_factor           = 1.0,   -- Scroll speed multiplier
      middle_button_emulation = false, -- No middle click emulation
    },
  },
})
