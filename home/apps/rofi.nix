# home/apps/rofi.nix
# Rofi application launcher configuration.
# Used as app launcher (Super+Space), window switcher (Super+Tab) and clipboard picker (Super+V).
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  programs.rofi = {
    enable  = true;
    package = pkgs.rofi;
    font    = "JetBrainsMono Nerd Font 13";

    extraConfig = {
      modi                = "drun,run";
      icon-theme          = "Papirus";
      show-icons          = true;
      drun-display-format = "{name}";
      disable-history     = false;
      hide-scrollbar      = true;
      display-drun        = " Apps";
      display-run         = " Run";
      sidebar-mode        = true;
    };

    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        # ── Color Variables ───────────────────────────────────────────────────
        "*" = {
          bg      = mkLiteral "#${colors.base}";
          bg2     = mkLiteral "#${colors.surface0}";
          bg3     = mkLiteral "#${colors.surface1}";
          fg      = mkLiteral "#${colors.text}";
          blue    = mkLiteral "#${colors.blue}";
          purple  = mkLiteral "#${colors.mauve}";
          red     = mkLiteral "#${colors.red}";
          muted   = mkLiteral "#${colors.overlay0}";
          background-color = mkLiteral "transparent";
          text-color       = mkLiteral "@fg";
          border-color     = mkLiteral "@blue";
        };

        # ── Window ────────────────────────────────────────────────────────────
        "window" = {
          background-color = mkLiteral "@bg";
          border           = mkLiteral "1px";
          border-color     = mkLiteral "@blue";
          border-radius    = mkLiteral "12px";
          width            = mkLiteral "600px";
          padding          = mkLiteral "12px";
        };

        # ── Layout ────────────────────────────────────────────────────────────
        "mainbox" = {
          background-color = mkLiteral "transparent";
          children         = mkLiteral "[inputbar, listview]";
          spacing          = mkLiteral "8px";
        };

        # ── Input Bar ─────────────────────────────────────────────────────────
        "inputbar" = {
          background-color = mkLiteral "@bg2";
          border-radius    = mkLiteral "8px";
          padding          = mkLiteral "8px 12px";
          children         = mkLiteral "[prompt, entry]";
          spacing          = mkLiteral "8px";
        };
        "prompt" = {
          text-color = mkLiteral "@blue";
        };
        "entry" = {
          background-color  = mkLiteral "transparent";
          text-color        = mkLiteral "@fg";
          placeholder       = "Search...";
          placeholder-color = mkLiteral "@muted";
        };

        # ── Results List ──────────────────────────────────────────────────────
        "listview" = {
          background-color = mkLiteral "transparent";
          lines            = 8;
          columns          = 1;
          scrollbar        = false;
          spacing          = mkLiteral "4px";
        };
        "element" = {
          background-color = mkLiteral "transparent";
          border-radius    = mkLiteral "8px";
          padding          = mkLiteral "8px 12px";
          spacing          = mkLiteral "8px";
        };
        "element selected" = {
          background-color = mkLiteral "@bg3";
          text-color       = mkLiteral "@purple";  # Mauve highlight on selected item
        };
        "element-icon" = {
          background-color = mkLiteral "transparent";
          size             = mkLiteral "24px";
        };
        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color       = mkLiteral "inherit";
          vertical-align   = mkLiteral "0.5";
        };
      };
  };
}