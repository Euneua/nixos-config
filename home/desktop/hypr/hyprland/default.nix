# home/desktop/hypr/hyprland/default.nix

{ config, pkgs, lib, inputs, ... }:
let
  theme = import ../../../colors/theme.nix;
  r     = theme.roles;
in
{
  wayland.windowManager.hyprland = {
  enable  = true;
  package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  xdg.configFile = {

    "hypr" = {
      source    = ./lua;
      recursive = true;
    };

    "hypr/colors.lua".text = ''
      -- Auto-generated from home/colors/theme.nix
      -- Do not edit manually. Changes go in colors-vesper.nix → nixos-rebuild switch.

      local M = {}

      -- ── Accent ──────────────────────────────────────────────────────────────
      M.accent        = "${r.accent}"        -- Primary accent
      M.accent_dim    = "${r.accent_dim}"    -- Dimmed accent
      M.accent_subtle = "${r.accent_subtle}" -- Subtle accent
      M.accent2       = "${r.accent2}"       -- Secondary accent
      M.accent2_dim   = "${r.accent2_dim}"   -- Dimmed secondary accent

      -- ── Backgrounds ─────────────────────────────────────────────────────────
      M.bg       = "${r.bg}"
      M.bg_dark  = "${r.bg_dark}"
      M.bg_dim   = "${r.bg_dim}"
      M.surface  = "${r.surface}"
      M.surface1 = "${r.surface1}"
      M.surface2 = "${r.surface2}"

      -- ── Borders ─────────────────────────────────────────────────────────────
      M.border          = "${r.border}"
      M.border_inactive = "${r.border_inactive}"

      -- ── Text ────────────────────────────────────────────────────────────────
      M.text    = "${r.text}"
      M.subtext = "${r.subtext}"
      M.muted   = "${r.muted}"
      M.subtle  = "${r.subtle}"

      -- ── Semantic ────────────────────────────────────────────────────────────
      M.error   = "${r.error}"   -- Error
      M.error2  = "${r.error2}"  -- Secondary error
      M.warning = "${r.warning}" -- Warning
      M.caution = "${r.caution}" -- Caution
      M.success = "${r.success}" -- Success
      M.info    = "${r.info}"    -- Info
      M.info2   = "${r.info2}"   -- Subtle info
      M.link    = "${r.link}"    -- Links
      M.link2   = "${r.link2}"   -- Secondary link

      -- ── Misc ────────────────────────────────────────────────────────────────
      M.shadow = "${r.shadow}"

      -- ── Helpers ─────────────────────────────────────────────────────────────
      -- M.rgba(M.accent, "ee") → "rgba(cfc5f5ee)"
      M.rgba = function(hex, alpha)
        return "rgba(" .. hex .. (alpha or "ff") .. ")"
      end

      -- M.hex(M.bg_dark) → "0xff110f0d"
      M.hex = function(hex)
        return "0xff" .. hex
      end

      return M
    '';
  };
}
