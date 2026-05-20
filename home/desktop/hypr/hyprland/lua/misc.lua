-- misc.lua

hl.config({
  misc = {
    force_default_wallpaper      = 0,                         -- Disable default Hyprland wallpaper
    disable_hyprland_logo        = true,                      -- Hide logo on empty workspaces
    disable_splash_rendering     = true,                      -- Disable splash text on startup
    font_family                  = "JetBrainsMono Nerd Font", -- Font for Hyprland UI elements
    focus_on_activate            = false,                     -- Don't steal focus on activation requests
    animate_mouse_windowdragging = true,                      -- Animate windows while dragging
    vrr                          = 0,                         -- VRR/FreeSync disabled
    mouse_move_enables_dpms      = true,                      -- Wake display on mouse movement
    key_press_enables_dpms       = true,                      -- Wake display on key press
  },
})
