# home/desktop/hypr/hypridle.nix
# Hypridle configuration for automatic screen locking and display power management.
# Locks the screen after 10 minutes of inactivity, turns off the display after 11.

{ config, pkgs, ... }:
{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        after_sleep_cmd     = "hyprctl dispatch dpms on";  # Re-enable display after waking from sleep
        ignore_dbus_inhibit = false;                       # Respect apps that block idle (e.g. video players)
        lock_cmd            = "hyprlock";
      };

      listener = [
        {
          timeout    = 600;        # 10 minutes – lock the screen
          on-timeout = "hyprlock";
        }
        {
          timeout    = 660;                              # 11 minutes – turn off the display
          on-timeout = "hyprctl dispatch dpms off";
          on-resume  = "hyprctl dispatch dpms on";       # Re-enable display on activity
        }
      ];
    };
  };
}