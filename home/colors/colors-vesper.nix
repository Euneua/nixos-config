# home/colors/colors-vesper.nix
# Vesper – warm dark base, lavender + beige accents.
# To switch themes: home/colors/theme.nix

let p = {
  crust    = "110f0d";
  mantle   = "1a1714";
  base     = "211e1a";
  surface0 = "2c2925";
  surface1 = "38342f";
  surface2 = "47433d";
  overlay0 = "5c5751";
  overlay1 = "716b64";
  overlay2 = "8a837b";
  subtext0 = "a89f96";
  subtext1 = "c4bab0";
  text     = "e2d9ce";
  lavender = "cfc5f5";
  mauve    = "b5a8e8";
  iris     = "9b8fd4";
  beige    = "e8c99a";
  sand     = "d4aa78";
  wheat    = "c09060";
  red      = "e08080";
  maroon   = "c06868";
  peach    = "d49555";
  yellow   = "d4be70";
  green    = "8abf78";
  teal     = "78bfb0";
  sky      = "a5d4cc";
  blue     = "88aae0";
  sapphire = "7898d0";
  rosewater = "edd8cc";
  flamingo  = "e0a0a0";
  pink      = "d8c0f0";
}; in
{
  inherit (p)
    crust mantle base surface0 surface1 surface2
    overlay0 overlay1 overlay2 subtext0 subtext1 text
    lavender mauve iris beige sand wheat
    red maroon peach yellow green teal sky blue sapphire
    rosewater flamingo pink;

  crust-rgb    = "17, 15, 13";
  mantle-rgb   = "26, 23, 20";
  base-rgb     = "33, 30, 26";
  surface0-rgb = "44, 41, 37";
  surface1-rgb = "56, 52, 47";
  surface2-rgb = "71, 67, 61";
  overlay0-rgb = "92, 87, 81";
  overlay1-rgb = "113, 107, 100";
  overlay2-rgb = "138, 131, 123";
  subtext0-rgb = "168, 159, 150";
  subtext1-rgb = "196, 186, 176";
  text-rgb     = "226, 217, 206";
  lavender-rgb = "207, 197, 245";
  mauve-rgb    = "181, 168, 232";
  iris-rgb     = "155, 143, 212";
  beige-rgb    = "232, 201, 154";
  sand-rgb     = "212, 170, 120";
  wheat-rgb    = "192, 144, 96";
  red-rgb      = "224, 128, 128";
  maroon-rgb   = "192, 104, 104";
  peach-rgb    = "212, 149, 85";
  yellow-rgb   = "212, 190, 112";
  green-rgb    = "138, 191, 120";
  teal-rgb     = "120, 191, 176";
  sky-rgb      = "165, 212, 204";
  blue-rgb     = "136, 170, 224";
  sapphire-rgb = "120, 152, 208";

  # ── Roles ─────────────────────────────────────────────────────────────────────
  roles = {
    # Accent
    accent        = p.lavender; # Primary accent – active borders, highlights
    accent_dim    = p.iris;     # Dimmed accent – inactive states
    accent_subtle = p.mauve;    # Subtle accent – UI elements
    accent2       = p.beige;    # Secondary accent – warm
    accent2_dim   = p.wheat;    # Dimmed secondary accent

    # Backgrounds
    bg       = p.base;     # Main background
    bg_dark  = p.crust;    # Deepest background, shadows
    bg_dim   = p.mantle;   # Dimmed background
    surface  = p.surface0; # Inactive elements
    surface1 = p.surface1; # Slightly elevated
    surface2 = p.surface2; # Borders, separators

    # Borders
    border          = p.lavender; # Active border
    border_inactive = p.surface2; # Inactive border

    # Text
    text    = p.text;     # Primary text
    subtext = p.subtext1; # Secondary text
    muted   = p.overlay1; # Muted text, comments
    subtle  = p.overlay0; # Very muted

    # Semantic
    error   = p.red;      # Error
    error2  = p.maroon;   # Secondary error
    warning = p.peach;    # Warning
    caution = p.yellow;   # Caution
    success = p.green;    # Success
    info    = p.teal;     # Info
    info2   = p.sky;      # Subtle info
    link    = p.blue;     # Links, references
    link2   = p.sapphire; # Secondary link

    # Misc
    shadow = p.crust; # Drop shadows
  };
}
