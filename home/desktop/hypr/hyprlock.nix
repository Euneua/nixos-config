# home/desktop/hypr/hyprlock.nix
{ config, pkgs, ... }:
let
  colors = import ../../colors/theme.nix;
  r = colors.roles;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor         = true;
        grace               = 0;
      };
      background = [
        {
          path        = "~/Pictures/wallpapers/wallpaper.jpg";
          blur_passes = 3;
          blur_size   = 7;
          brightness  = 0.6;
        }
      ];
      input-field = [
        {
          size             = "300, 50";
          position         = "0, -80";
          halign           = "center";
          valign           = "center";
          outer_color      = "rgba(${colors."accent-rgb"}, 0.5)";
          inner_color      = "rgba(${colors."base-rgb"}, 0.9)";
          font_color       = "rgb(${colors."text-rgb"})";
          fade_on_empty    = true;
          placeholder_text = "Password...";
          check_color      = "rgba(${colors."accent-rgb"}, 1)";
          fail_color       = "rgba(${colors."error-rgb"}, 1)";
          fail_text        = "Wrong password";
          capslock_color   = "rgba(${colors."caution-rgb"}, 1)";
          rounding         = 12;
        }
      ];
      label = [
        {
          text        = "cmd[update:1000] echo \"$(date +\"%H:%M\")\"";
          color       = "rgba(${colors."text-rgb"}, 1)";
          font_size   = 72;
          font_family = "JetBrainsMono Nerd Font";
          position    = "0, 80";
          halign      = "center";
          valign      = "center";
        }
        {
          text        = "cmd[update:1000] echo \"$(date +\"%A, %d. %B %Y\")\"";
          color       = "rgba(${colors."accent-rgb"}, 0.8)";
          font_size   = 18;
          font_family = "JetBrainsMono Nerd Font";
          position    = "0, 10";
          halign      = "center";
          valign      = "center";
        }
      ];
    };
  };
}
