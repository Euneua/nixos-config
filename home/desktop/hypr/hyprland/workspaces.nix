# home/desktop/hypr/hyprland/workspaces.nix
# Workspace definitions and persistent rules.
# Workspaces 1-5 are on number keys, 6-10 on z,u,i,o,p (see keybinds.nix).

{ config, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    workspace = [
      # Workspace 1 is persistent and the default on session start
      "1, persistent:true, default:true"
      # Uncomment to pin workspace 1 to the internal display explicitly
      # "1, monitor:eDP-1, persistent:true, default:true"
    ];
  };
}