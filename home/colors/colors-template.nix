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
  red      = "000000"; # Error
  red2     = "000000"; # Secondary error
  orange   = "000000"; # Warning
  yellow   = "000000"; # Caution
  green    = "000000"; # Success
  teal     = "000000"; # Info
  teal2    = "000000"; # Subtle info
  blue     = "000000"; # Links, references
  blue2    = "000000"; # Secondary link

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
    red red2 orange yellow green teal teal2 blue blue2
    extra1 extra2 extra3;

  crust-rgb    = "0, 0, 0";
  mantle-rgb   = "0, 0, 0";
  base-rgb     = "0, 0, 0";
  surface0-rgb = "0, 0, 0";
  surface1-rgb = "0, 0, 0";
  surface2-rgb = "0, 0, 0";
  text-rgb     = "0, 0, 0";
  accent-rgb   = "0, 0, 0";
  red-rgb      = "0, 0, 0";
  green-rgb    = "0, 0, 0";
  blue-rgb     = "0, 0, 0";

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
    muted   = p.overlay1;
    subtle  = p.overlay0;

    error   = p.red;
    error2  = p.red2;
    warning = p.orange;
    caution = p.yellow;
    success = p.green;
    info    = p.teal;
    info2   = p.teal2;
    link    = p.blue;
    link2   = p.blue2;

    shadow = p.crust;
  };
}
