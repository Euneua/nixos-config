# home/desktop/waybar.nix
{ config, pkgs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;
in
{
  programs.waybar = {
    enable         = true;
    systemd.enable = true;

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
      modules-right  = [ "network" "pulseaudio" "battery" "custom/swaync" ];

      "hyprland/workspaces" = {
        format         = "{id}";
        on-click       = "activate";
        sort-by-number = true;
      };

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
            months   = "<span color='#${r.accent}'><b>{}</b></span>";
            days     = "<span color='#${r.text}'>{}</span>";
            weeks    = "<span color='#${r.link}'><b>W{}</b></span>";
            weekdays = "<span color='#${r.link}'><b>{}</b></span>";
            today    = "<span color='#${r.accent}'><b><u>{}</u}</b></span>";
          };
        };
      };

      "network" = {
        format-wifi             = " {signalStrength}%";
        format-ethernet         = " {ipaddr}";
        format-disconnected     = "󰖪";
        tooltip-format-wifi     = "{essid} ({signalStrength}%)";
        tooltip-format-ethernet = "{ifname}: {ipaddr}";
        on-click                = "nm-connection-editor";
      };

      "pulseaudio" = {
        format       = "{icon} {volume}%";
        format-muted = "󰝟";
        format-icons = { default = [ "" "" "" ]; };
        on-click     = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        scroll-step  = 5;
      };

      "battery" = {
        format          = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
        format-icons    = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        states = { warning = 30; critical = 15; };
        tooltip-format  = "{timeTo}";
      };

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

      window#waybar {
        background-color: rgba(${colors."base-rgb"}, 0.90);
        border-bottom-left-radius: 8px;
        border-bottom-right-radius: 8px;
        color: #${r.text};
      }

      .modules-left,
      .modules-center,
      .modules-right {
        padding: 0 8px;
      }

      #workspaces button {
        color: #${r.muted};
        background: transparent;
        padding: 2px 8px;
        border-radius: 8px;
        margin: 4px 2px;
        transition: all 0.2s ease;
      }

      #workspaces button.active {
        color: #${r.accent};
        background: rgba(${colors."accent-rgb"}, 0.15);
      }

      #workspaces button:hover {
        color: #${r.accent_subtle};
        background: rgba(${colors."accent2-rgb"}, 0.15);
      }

      #clock {
        color: #${r.text};
        font-weight: bold;
        padding: 0 8px;
      }

      tooltip {
        background-color: #${r.bg};
        border: 1px solid rgba(${colors."accent-rgb"}, 0.4);
        border-radius: 10px;
        color: #${r.text};
      }

      tooltip label {
        color: #${r.text};
      }

      #network,
      #pulseaudio,
      #battery,
      #custom-swaync {
        color: #${r.text};
        background: rgba(${colors."surface0-rgb"}, 0.6);
        border-radius: 8px;
        padding: 2px 10px;
        margin: 4px 2px;
      }

      #network:hover,
      #pulseaudio:hover,
      #battery:hover,
      #custom-swaync:hover {
        background: rgba(${colors."accent-rgb"}, 0.2);
        color: #${r.accent};
      }

      #battery.warning  { color: #${r.caution}; }
      #battery.critical { color: #${r.error};   }
      #battery.charging { color: #${r.success};  }
    '';
  };
}
