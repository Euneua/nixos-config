-- xwayland.lua

hl.config({
  xwayland = {
    enabled              = true,  -- Enable XWayland for legacy X11 apps
    use_nearest_neighbor = false, -- Linear filtering for scaled windows
    force_zero_scaling   = true,  -- Let Hyprland handle scaling, not XWayland
  },
})
