# colors.nix
# Central color definitions based on the Catppuccin Mocha palette.
# Import this file wherever colors are needed to keep the theme consistent.
# Usage: let colors = import ../colors.nix; in colors.base

{
  # ── Base Colors ─────────────────────────────────────────────────────────────
  crust    = "11111b"; # Deepest background (borders, shadows)
  mantle   = "181825"; # Slightly lighter background
  base     = "1e1e2e"; # Primary background
  surface0 = "313244"; # Subtle surface / inactive elements
  surface1 = "45475a"; # Slightly elevated surface
  surface2 = "585b70"; # More visible surface (e.g. scrollbars)

  # ── Text & Overlays ─────────────────────────────────────────────────────────
  overlay0 = "6c7086"; # Muted text / comments
  overlay1 = "7f849c"; # Slightly visible text
  overlay2 = "9399b2"; # Dimmed UI text
  subtext0 = "a6adc8"; # Secondary text
  subtext1 = "bac2de"; # Slightly prominent secondary text
  text     = "cdd6f4"; # Primary text

  # ── Accent Colors ───────────────────────────────────────────────────────────
  rosewater = "f5e0dc"; # Lightest pink / almost white
  flamingo  = "f2cdcd"; # Soft pink
  pink      = "f5c2e7"; # Pink
  mauve     = "cba6f7"; # Mauve / purple – primary accent for this setup
  red       = "f38ba8"; # Red (errors)
  maroon    = "eba0ac"; # Dark red / maroon
  peach     = "fab387"; # Peach / orange
  yellow    = "f9e2af"; # Yellow (warnings)
  green     = "a6e3a1"; # Green (success)
  teal      = "94e2d5"; # Teal
  sky       = "89dceb"; # Light sky blue
  sapphire  = "74c7ec"; # Sapphire blue
  blue      = "89b4fa"; # Blue
  lavender  = "b4befe"; # Soft blue accent

  # ── RGB Variants ────────────────────────────────────────────────────────────
  # Decimal RGB values for use in rgba() contexts (e.g. CSS, hyprlock, waybar)
  crust-rgb    = "17, 17, 27";
  mantle-rgb   = "24, 24, 37";
  base-rgb     = "30, 30, 46";
  surface0-rgb = "49, 50, 68";
  surface1-rgb = "69, 71, 90";
  surface2-rgb = "88, 91, 112";
  overlay0-rgb = "108, 112, 134";
  overlay1-rgb = "127, 132, 156";
  overlay2-rgb = "147, 153, 178";
  subtext0-rgb = "166, 173, 200";
  subtext1-rgb = "186, 194, 222";
  text-rgb     = "205, 214, 244";
  mauve-rgb    = "203, 166, 247";
  blue-rgb     = "137, 180, 250";
  green-rgb    = "166, 227, 161";
  red-rgb      = "243, 139, 168";
  yellow-rgb   = "249, 226, 175";
  sky-rgb      = "137, 220, 235";
  peach-rgb    = "250, 179, 135";

  # ── Cheatsheet Prefix Colors ────────────────────────────────────────────────
  # Colors for category prefixes [H], [N], [B] in the keybind cheatsheet
  cheatsheet-hyprland = "cba6f7"; # mauve  – Hyprland [H]
  cheatsheet-neovim   = "a6e3a1"; # green  – Neovim   [N]
  cheatsheet-browser  = "89b4fa"; # blue   – Browser  [B]
  cheatsheet-unknown  = "6c7086"; # overlay0 – fallback [?]
}
