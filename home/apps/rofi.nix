# home/apps/rofi.nix
{ config, pkgs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;
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
        "*" = {
          bg      = mkLiteral "#${r.bg}";
          bg2     = mkLiteral "#${r.surface}";
          bg3     = mkLiteral "#${r.surface1}";
          fg      = mkLiteral "#${r.text}";
          accent  = mkLiteral "#${r.accent}";
          accent2 = mkLiteral "#${r.accent2}";
          red     = mkLiteral "#${r.error}";
          muted   = mkLiteral "#${r.muted}";
          background-color = mkLiteral "transparent";
          text-color       = mkLiteral "@fg";
          border-color     = mkLiteral "@accent";
        };

        "window" = {
          background-color = mkLiteral "@bg";
          border           = mkLiteral "1px";
          border-color     = mkLiteral "@accent";
          border-radius    = mkLiteral "12px";
          width            = mkLiteral "600px";
          padding          = mkLiteral "12px";
        };

        "mainbox" = {
          background-color = mkLiteral "transparent";
          children         = mkLiteral "[inputbar, listview]";
          spacing          = mkLiteral "8px";
        };

        "inputbar" = {
          background-color = mkLiteral "@bg2";
          border-radius    = mkLiteral "8px";
          padding          = mkLiteral "8px 12px";
          children         = mkLiteral "[prompt, entry]";
          spacing          = mkLiteral "8px";
        };
        "prompt" = {
          text-color = mkLiteral "@accent";
        };
        "entry" = {
          background-color  = mkLiteral "transparent";
          text-color        = mkLiteral "@fg";
          placeholder       = "Search...";
          placeholder-color = mkLiteral "@muted";
        };

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
          text-color       = mkLiteral "@accent";
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
