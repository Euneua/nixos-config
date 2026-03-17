# home/colors.nix
# Central color definitions based on the Catppuccin Mocha palette.
# Import wherever colors are needed:
#   let colors = import ../colors.nix; in colors.mauve
#
# Hex values have no # prefix (compatible with Hyprland, Waybar, Hyprlock).
# RGB variants are for rgba() contexts (Waybar CSS, Hyprlock shadows etc.).
{
  # ── Base Colors ─────────────────────────────────────────────────────────────
  crust        = "11111b";      # Borders, shadows, deepest background
  crust-rgb    = "17, 17, 27";

  mantle       = "181825";      # SDDM / login background
  mantle-rgb   = "24, 24, 37";

  base         = "1e1e2e";      # Primary background (Waybar, Hyprlock, Rofi)
  base-rgb     = "30, 30, 46";

  surface0     = "313244";      # Inactive elements, Waybar unfocused workspaces
  surface0-rgb = "49, 50, 68";

  surface1     = "45475a";      # Slightly elevated surface
  surface1-rgb = "69, 71, 90";

  surface2     = "585b70";      # Scrollbars, separators
  surface2-rgb = "88, 91, 112";

  # ── Text & Overlays ─────────────────────────────────────────────────────────
  overlay0     = "6c7086";      # Comments, muted text, cheatsheet fallback [?]
  overlay0-rgb = "108, 112, 134";

  overlay1     = "7f849c";      # Zsh secondary prompt, dimmed UI
  overlay1-rgb = "127, 132, 156";

  overlay2     = "9399b2";      # Dimmed UI text
  overlay2-rgb = "147, 153, 178";

  subtext0     = "a6adc8";      # Secondary text
  subtext0-rgb = "166, 173, 200";

  subtext1     = "bac2de";      # Slightly prominent secondary text
  subtext1-rgb = "186, 194, 222";

  text         = "cdd6f4";      # Primary text (Waybar, Rofi, Hyprlock, Zsh)
  text-rgb     = "205, 214, 244";

  # ── Accent Colors ───────────────────────────────────────────────────────────
  rosewater    = "f5e0dc";      # Lightest pink
  flamingo     = "f2cdcd";      # Soft pink
  pink         = "f5c2e7";      # Pink

  mauve        = "cba6f7";      # Primary accent – Hyprland borders, Waybar active, Zsh prompt, cheatsheet [H]
  mauve-rgb    = "203, 166, 247";

  red          = "f38ba8";      # Errors (LSP, Zsh, Waybar)
  red-rgb      = "243, 139, 168";

  maroon       = "eba0ac";      # Dark red / maroon
  yellow       = "f9e2af";      # Warnings (LSP, Zsh)
  yellow-rgb   = "249, 226, 175";

  peach        = "fab387";      # Orange accents
  peach-rgb    = "250, 179, 135";

  green        = "a6e3a1";      # Success, Git added, LSP hints, cheatsheet [N]
  green-rgb    = "166, 227, 161";

  teal         = "94e2d5";      # Teal accents
  sky          = "89dceb";      # Hyprlock ring, light accents
  sky-rgb      = "137, 220, 235";

  sapphire     = "74c7ec";      # Sapphire blue
  blue         = "89b4fa";      # Links, Git info, cheatsheet [B]
  blue-rgb     = "137, 180, 250";

  lavender     = "b4befe";      # Soft blue, Hyprland inactive borders
}