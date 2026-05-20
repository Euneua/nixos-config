-- appearance/animations.lua

hl.config({ animations = { enabled = true } })

-- ── Curves ────────────────────────────────────────────────────────────────────
hl.curve("linear",         { type = "bezier", points = { { 0,    0    }, { 1,    1    } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5,  0.5  }, { 0.75, 1    } } })
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.22, 1    }, { 0.36, 1    } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0    }, { 0.35, 1    } } })
hl.curve("easeOutBack",    { type = "bezier", points = { { 0.34, 1.56 }, { 0.64, 1    } } })

-- ── Animations ────────────────────────────────────────────────────────────────
-- Windows
hl.animation({ leaf = "windows",    enabled = true, speed = 5, bezier = "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "windowsIn",  enabled = true, speed = 5, bezier = "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 4, bezier = "easeOutBack",    style = "popin 80%" })

-- Fades
hl.animation({ leaf = "fade",    enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeIn",  enabled = true, speed = 4, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "almostLinear" })

-- Workspaces
hl.animation({ leaf = "workspaces",    enabled = true, speed = 5, bezier = "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 5, bezier = "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 4, bezier = "easeInOutCubic", style = "slide" })

-- Layers (Waybar, notifications – slightly slower)
hl.animation({ leaf = "layers",        enabled = true, speed = 4, bezier = "easeOutQuint",   style = "slide" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4, bezier = "easeOutQuint",   style = "fade"  })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 3, bezier = "easeInOutCubic", style = "fade"  })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 3, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2, bezier = "almostLinear" })

-- Border
hl.animation({ leaf = "border",     enabled = true, speed = 8, bezier = "linear" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 5, bezier = "easeOutQuint" })
