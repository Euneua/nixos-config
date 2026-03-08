# gtk.nix
# GTK theme configuration applied to all GTK3 and GTK4 applications.
# Uses Catppuccin Mocha Mauve to match the Neovim and system colorscheme.

{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    # ── Theme ───────────────────────────────────────────────────────────────
    # Catppuccin Mocha with Mauve accent – matches the Neovim colorscheme
    theme = {
      name    = "catppuccin-mocha-mauve-standard+default";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        variant = "mocha";
      };
    };

    # ── Icons ───────────────────────────────────────────────────────────────
    iconTheme = {
      name    = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    # ── Cursor ──────────────────────────────────────────────────────────────
    # Also set system-wide via home.pointerCursor (see home.nix)
    cursorTheme = {
      name    = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size    = 24;
    };

    # ── Font ────────────────────────────────────────────────────────────────
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };
  };

  # Force GTK4 apps to use the same theme via environment variable
  home.sessionVariables = {
    GTK_THEME = "catppuccin-mocha-mauve-standard+default";
  };
}
