# home/colors/colors-template.nix
# Template for creating a custom theme.
# Copy this file, rename it, fill in your hex values.
# Then add it to home/colors/theme.nix to activate it.
#
# Hex values without # prefix, e.g. "1e1e2e"
# RGB values as "r, g, b" strings for rgba() contexts, e.g. "30, 30, 46"

let p = {
  # ── Base ──────────────────────────────────────────────────────────────────────
  crust    = "000000"; # Deepest background, shadows
  mantle   = "000000"; # Dimmed background
  base     = "000000"; # Main background
  surface0 = "000000"; # Inactive elements
  surface1 = "000000"; # Slightly elevated
  surface2 = "000000"; # Borders, separators

  # ── Text ──────────────────────────────────────────────────────────────────────
  overlay0 = "000000"; # Very muted
  overlay1 = "000000"; # Muted
  overlay2 = "000000"; # Dimmed
  subtext0 = "000000"; # Secondary text
  subtext1 = "000000"; # Slightly prominent secondary
  text     = "000000"; # Primary text

  # ── Primary Accent ────────────────────────────────────────────────────────────
  accent   = "000000"; # Main accent – active borders, highlights
  accent2  = "000000"; # Mid accent – UI elements
  accent3  = "000000"; # Dim accent – inactive states

  # ── Secondary Accent ──────────────────────────────────────────────────────────
  accent_b  = "000000"; # Secondary accent
  accent_b2 = "000000"; # Dim secondary accent

  # ── Semantic ──────────────────────────────────────────────────────────────────
  error   = "000000"; # Error
  error2  = "000000"; # Secondary error
  warning = "000000"; # Warning
  caution = "000000"; # Caution
  success = "000000"; # Success
  info    = "000000"; # Info
  info2   = "000000"; # Subtle info
  link    = "000000"; # Links, references
  link2   = "000000"; # Secondary link

  # ── Decorative ────────────────────────────────────────────────────────────────
  extra1 = "000000";
  extra2 = "000000";
  extra3 = "000000";
}; in
{
  inherit (p)
    crust mantle base surface0 surface1 surface2
    overlay0 overlay1 overlay2 subtext0 subtext1 text
    accent accent2 accent3 accent_b accent_b2
    error error2 warning caution success info info2 link link2
    extra1 extra2 extra3;

  # ── RGB ───────────────────────────────────────────────────────────────────────
  crust-rgb    = "0, 0, 0";
  mantle-rgb   = "0, 0, 0";
  base-rgb     = "0, 0, 0";
  surface0-rgb = "0, 0, 0";
  surface1-rgb = "0, 0, 0";
  surface2-rgb = "0, 0, 0";
  overlay0-rgb = "0, 0, 0";
  overlay1-rgb = "0, 0, 0";
  overlay2-rgb = "0, 0, 0";
  text-rgb     = "0, 0, 0";
  accent-rgb   = "0, 0, 0";
  accent2-rgb  = "0, 0, 0";
  accent_b-rgb = "0, 0, 0";
  error-rgb    = "0, 0, 0";
  warning-rgb  = "0, 0, 0";
  caution-rgb  = "0, 0, 0";
  success-rgb  = "0, 0, 0";
  info-rgb     = "0, 0, 0";
  link-rgb     = "0, 0, 0";

  # ── Roles ─────────────────────────────────────────────────────────────────────
  roles = {
    accent        = p.accent;
    accent_dim    = p.accent3;
    accent_subtle = p.accent2;
    accent2       = p.accent_b;
    accent2_dim   = p.accent_b2;

    bg       = p.base;
    bg_dark  = p.crust;
    bg_dim   = p.mantle;
    surface  = p.surface0;
    surface1 = p.surface1;
    surface2 = p.surface2;

    border          = p.accent;
    border_inactive = p.surface2;

    text    = p.text;
    subtext = p.subtext1;
    muted   = p.overlay2;
    subtle  = p.overlay0;

    error   = p.error;
    error2  = p.error2;
    warning = p.warning;
    caution = p.caution;
    success = p.success;
    info    = p.info;
    info2   = p.info2;
    link    = p.link;
    link2   = p.link2;

    shadow = p.crust;
  };
}
