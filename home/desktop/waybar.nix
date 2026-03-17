# home/desktop/waybar.nix
# Waybar top bar configuration.
# Left: workspaces | Center: clock | Right: network, audio, battery, notifications.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  programs.waybar = {
    enable         = true;
    systemd.enable = true;  # Start Waybar as a systemd user service

    settings = [{
      layer        = "top";
      position     = "top";
      height       = 32;
      margin-top   = 0;
      margin-left  = 0;
      margin-right = 0;
      spacing      = 4;

      modules-left   = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right  = [
        "network"
        "pulseaudio"
        "battery"
        "custom/swaync"
      ];

      # ── Workspaces ──────────────────────────────────────────────────────
      "hyprland/workspaces" = {
        format         = "{id}";
        on-click       = "activate";
        sort-by-number = true;
      };

      # ── Clock ────────────────────────────────────────────────────────────
      # Left-click: toggle date, right-click: switch calendar mode
      "clock" = {
        format         = " {:%H:%M}";
        format-alt     = " {:%d.%m.%Y %H:%M}";
        tooltip-format = "<big>{:%B %Y}</big>\n<tt><small>{calendar}</small></tt>";
        calendar = {
          mode           = "month";
          mode-mon-col   = 3;
          on-scroll      = 1;
          on-click-right = "mode";
          format = {
            months   = "<span color='#${colors.mauve}'><b>{}</b></span>";
            days     = "<span color='#${colors.text}'>{}</span>";
            weeks    = "<span color='#${colors.blue}'><b>W{}</b></span>";
            weekdays = "<span color='#${colors.blue}'><b>{}</b></span>";
            today    = "<span color='#${colors.mauve}'><b><u>{}</u></b></span>";
          };
        };
      };

      # ── Network ──────────────────────────────────────────────────────────
      # Click opens nm-connection-editor
      "network" = {
        format-wifi             = " {signalStrength}%";
        format-ethernet         = " {ipaddr}";
        format-disconnected     = "󰖪";
        tooltip-format-wifi     = "{essid} ({signalStrength}%)";
        tooltip-format-ethernet = "{ifname}: {ipaddr}";
        on-click                = "nm-connection-editor";
      };

      # ── Audio ─────────────────────────────────────────────────────────────
      # Click toggles mute, scroll adjusts volume
      "pulseaudio" = {
        format       = "{icon} {volume}%";
        format-muted = "󰝟";
        format-icons = { default = [ "" "" "" ]; };
        on-click     = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        scroll-step  = 5;
      };

      # ── Battery ───────────────────────────────────────────────────────────
      "battery" = {
        format          = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-icons    = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        states = {
          warning  = 30;  # Yellow below 30%
          critical = 15;  # Red below 15%
        };
        tooltip-format = "{timeTo}";
      };

      # ── SwayNC Notification Bell ──────────────────────────────────────────
      # Left-click: toggle notification center, right-click: toggle DND
      "custom/swaync" = {
        exec           = "swaync-client -swb";
        return-type    = "json";
        format         = "󰂚 {text}";
        on-click       = "swaync-client -t";
        on-click-right = "swaync-client -d";
        escape         = true;
      };
    }];

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 13px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      /* Bar background */
      window#waybar {
        background-color: rgba(${colors.base-rgb}, 0.90);
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
        color: #${colors.text};
      }

      .modules-left,
      .modules-center,
      .modules-right {
        padding: 0 8px;
      }

      /* Workspace buttons */
      #workspaces button {
        color: #${colors.overlay0};
        background: transparent;
        padding: 2px 8px;
        border-radius: 8px;
        margin: 4px 2px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: #${colors.mauve};
        background: rgba(${colors.mauve-rgb}, 0.15);
      }

      #workspaces button:hover {
        color: #${colors.blue};
        background: rgba(${colors.blue-rgb}, 0.15);
      }

      /* Clock */
      #clock {
        color: #${colors.text};
        font-weight: bold;
        padding: 0 8px;
      }

      /* Tooltip */
      tooltip {
        background-color: #${colors.base};
        border: 1px solid rgba(${colors.blue-rgb}, 0.4);
        border-radius: 10px;
        color: #${colors.text};
      }

      tooltip label {
        color: #${colors.text};
      }

      /* Right-side modules */
      #network,
      #pulseaudio,
      #battery,
      #custom-swaync {
        color: #${colors.text};
        background: rgba(${colors.surface0-rgb}, 0.6);
        border-radius: 8px;
        padding: 2px 10px;
        margin: 4px 2px;
      }

      #network:hover,
      #pulseaudio:hover,
      #battery:hover,
      #custom-swaync:hover {
        background: rgba(${colors.blue-rgb}, 0.2);
        color: #${colors.blue};
      }

      /* Battery state colors */
      #battery.warning  { color: #${colors.yellow}; }
      #battery.critical { color: #${colors.red};    }
      #battery.charging { color: #${colors.green};  }
    '';
  };
}