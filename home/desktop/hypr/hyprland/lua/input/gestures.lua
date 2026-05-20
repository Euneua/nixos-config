-- input/gestures.lua

hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace"  }) -- Swipe left/right → switch workspace
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" }) -- Swipe up         → toggle fullscreen
hl.gesture({ fingers = 3, direction = "down",       action = "close"      }) -- Swipe down        → close window
