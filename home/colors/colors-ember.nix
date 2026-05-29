# home/colors/colors-ember.nix
# Ember – warm dark base, red accents.
# To switch themes: home/colors/theme.nix

let p = {
  # ── Base ──────────────────────────────────────────────────────────────────────
  crust    = "110f0d"; # Deepest background, shadows
  mantle   = "1a1714"; # Dimmed background
  base     = "211e1a"; # Main background
  surface0 = "2c2925"; # Inactive elements
  surface1 = "38342f"; # Slightly elevated
  surface2 = "47433d"; # Borders, separators

  # ── Text ──────────────────────────────────────────────────────────────────────
  overlay0 = "5c5751"; # Very muted
  overlay1 = "716b64"; # Muted
  overlay2 = "8a837b"; # Dimmed
  subtext0 = "a89f96"; # Secondary text
  subtext1 = "c4bab0"; # Slightly prominent secondary
  text     = "e2d9ce"; # Primary text

  # ── Primary Accent ────────────────────────────────────────────────────────────
  accent   = "e05555"; # Main accent – ember red
  accent2  = "c93333"; # Mid accent – dim red
  accent3  = "aa2222"; # Dim accent – deep red

  # ── Secondary Accent ──────────────────────────────────────────────────────────
  accent_b  = "e8c99a"; # Secondary accent – beige
  accent_b2 = "c09060"; # Dim secondary accent – wheat

  # ── Semantic ──────────────────────────────────────────────────────────────────
  error   = "e08080";
  error2  = "c06868";
  warning = "d49555";
  caution = "d4be70";
  success = "8abf78";
  info    = "78bfb0";
  info2   = "a5d4cc";
  link    = "88aae0";
  link2   = "7898d0";

  # ── Decorative ────────────────────────────────────────────────────────────────
  extra1 = "edd8cc";
  extra2 = "e0a0a0";
  extra3 = "d8c0f0";
}; in
{
  inherit (p)
    crust mantle base surface0 surface1 surface2
    overlay0 overlay1 overlay2 subtext0 subtext1 text
    accent accent2 accent3 accent_b accent_b2
    error error2 warning caution success info info2 link link2
    extra1 extra2 extra3;

  # ── RGB ───────────────────────────────────────────────────────────────────────
  crust-rgb    = "17, 15, 13";
  mantle-rgb   = "26, 23, 20";
  base-rgb     = "33, 30, 26";
  surface0-rgb = "44, 41, 37";
  surface1-rgb = "56, 52, 47";
  surface2-rgb = "71, 67, 61";
  overlay0-rgb = "92, 87, 81";
  overlay1-rgb = "113, 107, 100";
  overlay2-rgb = "138, 131, 123";
  text-rgb     = "226, 217, 206";
  accent-rgb   = "224, 85, 85";
  accent2-rgb  = "201, 51, 51";
  accent_b-rgb = "232, 201, 154";
  error-rgb    = "224, 128, 128";
  warning-rgb  = "212, 149, 85";
  caution-rgb  = "212, 190, 112";
  success-rgb  = "138, 191, 120";
  info-rgb     = "120, 191, 176";
  link-rgb     = "136, 170, 224";

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
