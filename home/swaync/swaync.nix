# swaync/swaync.nix
# SwayNC notification daemon configuration.
# Includes the JSON config and CSS stylesheet.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  # ── JSON Config ─────────────────────────────────────────────────────────────
  xdg.configFile."swaync/config.json".text = builtins.toJSON {
    positionX            = "right";
    positionY            = "top";
    layer                = "overlay";
    control-center-layer = "top";
    layer-shell          = true;
    cssPriority          = "application";

    # Control center margins (top/right only – appears in the top-right corner)
    control-center-margin-top    = 8;
    control-center-margin-bottom = 0;
    control-center-margin-right  = 8;
    control-center-margin-left   = 0;

    # Notification behavior
    notification-2fa-action        = true;
    notification-inline-replies    = false;
    notification-icon-size         = 48;
    notification-body-image-height = 100;
    notification-body-image-width  = 200;

    # Timeout in seconds (0 = persistent until dismissed)
    timeout          = 5;
    timeout-low      = 3;
    timeout-critical = 0;

    # Dimensions
    fit-to-screen             = true;
    control-center-width      = 350;
    control-center-height     = 600;
    notification-window-width = 350;

    # UI behavior
    keyboard-shortcuts = true;
    image-visibility   = "when-available";
    transition-time    = 200;
    hide-on-clear      = false;
    hide-on-action     = true;
    script-fail-notify = true;

    # Widgets shown in the control center (top to bottom)
    widgets = [
      "inhibitors"
      "title"
      "dnd"
      "notifications"
    ];

    widget-config = {
      inhibitors = {
        text             = "Inhibitors";
        button-text      = "Clear All";
        clear-all-button = true;
      };
      title = {
        text             = "Notifications";
        clear-all-button = true;
        button-text      = "Clear All";
      };
      dnd = {
        text = "Do Not Disturb";
      };
      notifications = {
        fit-to-screen             = true;
        control-center-width      = 350;
        control-center-height     = 600;
        notification-window-width = 350;
      };
    };
  };

  # ── CSS Stylesheet ───────────────────────────────────────────────────────────
  xdg.configFile."swaync/style.css".text = ''
    * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 13px;
    }

    .control-center,
    .notification-window {
      background: transparent;
    }

    /* Control center panel */
    .control-center {
      background-color: rgba(${colors.base-rgb}, 0.92);
      border: 1px solid rgba(${colors.blue-rgb}, 0.3);
      border-radius: 12px;
      margin: 8px;
      padding: 8px;
    }

    /* Individual notification cards */
    .notification {
      background-color: rgba(${colors.surface0-rgb}, 0.95);
      border: 1px solid rgba(${colors.blue-rgb}, 0.25);
      border-radius: 10px;
      margin: 6px;
      padding: 12px;
      color: #${colors.text};
    }

    .notification:hover {
      background-color: rgba(${colors.surface1-rgb}, 0.95);
      border-color: rgba(${colors.mauve-rgb}, 0.5);
    }

    .notification-summary {
      font-weight: bold;
      color: #${colors.text};
      font-size: 14px;
    }

    .notification-body {
      color: rgba(${colors.text-rgb}, 0.75);
      font-size: 13px;
    }

    /* Action buttons inside notifications */
    .notification-action {
      background-color: rgba(${colors.blue-rgb}, 0.15);
      border: 1px solid rgba(${colors.blue-rgb}, 0.3);
      border-radius: 8px;
      color: #${colors.blue};
      padding: 4px 12px;
      margin: 4px;
    }

    .notification-action:hover {
      background-color: rgba(${colors.mauve-rgb}, 0.25);
      border-color: rgba(${colors.mauve-rgb}, 0.5);
      color: #${colors.mauve};
    }

    /* Dismiss button */
    .close-button {
      background-color: transparent;
      border: none;
      color: rgba(${colors.text-rgb}, 0.5);
      border-radius: 6px;
      padding: 2px 6px;
    }

    .close-button:hover {
      background-color: rgba(${colors.red-rgb}, 0.2);
      color: #${colors.red};
    }

    /* Control center title widget */
    .widget-title {
      color: #${colors.mauve};
      font-weight: bold;
      font-size: 15px;
      padding: 8px 4px;
    }

    .widget-title > button {
      background-color: rgba(${colors.blue-rgb}, 0.15);
      border: 1px solid rgba(${colors.blue-rgb}, 0.3);
      border-radius: 8px;
      color: #${colors.blue};
      padding: 4px 12px;
    }

    .widget-title > button:hover {
      background-color: rgba(${colors.red-rgb}, 0.2);
      border-color: rgba(${colors.red-rgb}, 0.4);
      color: #${colors.red};
    }

    /* Do Not Disturb toggle */
    .widget-dnd {
      color: #${colors.text};
      padding: 4px;
    }

    .widget-dnd > switch {
      border-radius: 12px;
      border: 1px solid rgba(${colors.blue-rgb}, 0.4);
      background-color: rgba(${colors.base-rgb}, 0.8);
    }

    .widget-dnd > switch:checked {
      background-color: rgba(${colors.mauve-rgb}, 0.4);
      border-color: rgba(${colors.mauve-rgb}, 0.6);
    }

    /* Inhibitors widget */
    .widget-inhibitors {
      color: #${colors.text};
      padding: 4px;
    }

    /* Empty state – hide image, dim label */
    .notifications-list image {
      min-height: 0;
      min-width: 0;
      opacity: 0;
      margin: 0;
      padding: 0;
    }

    .notifications-list label {
      color: rgba(${colors.mauve-rgb}, 0.5);
      font-size: 13px;
    }
  '';
}
