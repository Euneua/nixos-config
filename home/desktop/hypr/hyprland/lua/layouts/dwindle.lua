-- layouts/dwindle.lua

hl.config({
  dwindle = {
    pseudotile     = true,  -- Allows pseudo-tiling (toggle with SUPER+P)
    preserve_split = true,  -- Keep split direction when a window closes
    smart_split    = false, -- Don't split based on cursor position
    smart_resizing = true,  -- Resize both sides proportionally
    force_split    = 2,     -- Always split downward – predictable keyboard workflow
  },
})
