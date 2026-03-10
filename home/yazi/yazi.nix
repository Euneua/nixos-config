# yazi/yazi.nix
# Yazi terminal file manager configuration.
# Opened via Super+E (ghostty -e yazi) – see keybinds.nix.
# Colors follow the Catppuccin Mocha palette defined in colors.nix.

{ config, pkgs, ... }:
let
  colors = import ../colors.nix;
in
{
  programs.yazi = {
    enable           = true;
    shellWrapperName = "y";  # Use 'y' to cd into last directory on exit

    settings = {
      # ── Manager ─────────────────────────────────────────────────────────────
      manager = {
        layout         = [ 1 4 3 ]; # Column width ratio: parent | current | preview
        sort_by        = "natural";
        sort_sensitive = false;      # Case-insensitive sorting
        sort_reverse   = false;
        sort_dir_first = true;       # Directories appear before files
        show_hidden    = false;      # Toggle with . in Yazi
        show_symlink   = true;       # Show symlink targets
      };

      # ── Preview ─────────────────────────────────────────────────────────────
      preview = {
        image_delay   = 30;          # Delay in ms before rendering image previews
        image_filter  = "lanczos3";  # High-quality downscaling filter
        image_quality = 75;
        tab_size      = 2;
        max_width     = 600;
        max_height    = 900;
      };

      # ── Openers ─────────────────────────────────────────────────────────────
      opener = {
        edit = [
          {
            run  = "ghostty -e nvim \"$@\"";
            desc = "Neovim";
          }
        ];
        open = [
          {
            run  = "xdg-open \"$@\"";
            desc = "Open";
          }
        ];
      };

      # ── File Association Rules ───────────────────────────────────────────────
      open.rules = [
        { mime = "text/*";            use = "edit"; } # Open text files in Neovim
        { mime = "image/*";           use = "open"; } # Open images with xdg-open
        { mime = "video/*";           use = "open"; } # Open videos with xdg-open
        { mime = "application/pdf";   use = "open"; } # Open PDFs with xdg-open
      ];
    };

    theme = {
      # ── Manager ─────────────────────────────────────────────────────────────
      manager = {
        cwd             = { fg = "#${colors.blue}"; };          # Current working directory
        hovered         = { fg = "#${colors.base}"; bg = "#${colors.blue}"; };
        preview_hovered = { underline = true; };
        find_keyword    = { fg = "#${colors.yellow}"; bold = true; };  # Search highlight
        find_position   = { fg = "#${colors.mauve}"; bold = true; };   # Match position
        marker_copied   = { fg = "#${colors.green}";  bg = "#${colors.green}"; };
        marker_cut      = { fg = "#${colors.red}";    bg = "#${colors.red}"; };
        marker_marked   = { fg = "#${colors.mauve}";  bg = "#${colors.mauve}"; };
        marker_selected = { fg = "#${colors.blue}";   bg = "#${colors.blue}"; };
        tab_active      = { fg = "#${colors.base}";   bg = "#${colors.blue}"; };
        tab_inactive    = { fg = "#${colors.text}";   bg = "#${colors.surface0}"; };
        border_symbol   = "│";
        border_style    = { fg = "#${colors.overlay0}"; };
      };

      # ── Status Bar ──────────────────────────────────────────────────────────
      status = {
        separator_open  = "";
        separator_close = "";
        separator_style = { fg = "#${colors.surface0}"; bg = "#${colors.surface0}"; };
        mode_normal = { fg = "#${colors.base}"; bg = "#${colors.blue}";  bold = true; };
        mode_select = { fg = "#${colors.base}"; bg = "#${colors.green}"; bold = true; };
        mode_unset  = { fg = "#${colors.base}"; bg = "#${colors.red}";   bold = true; };
        progress_label  = { fg = "#${colors.text}"; bold = true; };
        progress_normal = { fg = "#${colors.blue}";  bg = "#${colors.surface0}"; };
        progress_error  = { fg = "#${colors.red}";   bg = "#${colors.surface0}"; };
      };

      # ── Input Dialog ────────────────────────────────────────────────────────
      input = {
        border   = { fg = "#${colors.blue}"; };
        title    = { fg = "#${colors.blue}"; };
        value    = { fg = "#${colors.text}"; };
        selected = { reversed = true; };
      };

      # ── Select Dialog ───────────────────────────────────────────────────────
      select = {
        border   = { fg = "#${colors.blue}"; };
        active   = { fg = "#${colors.mauve}"; };
        inactive = { fg = "#${colors.overlay0}"; };
      };
    };
  };
}
