# home/apps/yazi.nix
{ config, pkgs, ... }:
let
  colors = import ../colors/theme.nix;
  r = colors.roles;
in
{
  programs.yazi = {
    enable           = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        layout         = [ 1 4 3 ];
        sort_by        = "natural";
        sort_sensitive = false;
        sort_reverse   = false;
        sort_dir_first = true;
        show_hidden    = false;
        show_symlink   = true;
      };
      preview = {
        image_delay   = 30;
        image_filter  = "lanczos3";
        image_quality = 75;
        tab_size      = 2;
        max_width     = 600;
        max_height    = 900;
      };
      opener = {
        edit = [{ run = "ghostty -e nvim \"$@\""; desc = "Neovim"; }];
        open = [{ run = "xdg-open \"$@\"";        desc = "Open";   }];
      };
      open.rules = [
        { mime = "text/*";          use = "edit"; }
        { mime = "image/*";         use = "open"; }
        { mime = "video/*";         use = "open"; }
        { mime = "application/pdf"; use = "open"; }
      ];
    };
    theme = {
      filetype = {
        rules = [
          { mime = "inode/directory"; fg = "#${r.accent}"; }
        ];
      };
      manager = {
        cwd             = { fg = "#${r.link}"; };
        hovered         = { fg = "#${r.bg}";     bg = "#${r.accent}"; };
        preview_hovered = { underline = true; };
        find_keyword    = { fg = "#${r.caution}"; bold = true; };
        find_position   = { fg = "#${r.accent}";  bold = true; };
        marker_copied   = { fg = "#${r.success}"; bg = "#${r.success}"; };
        marker_cut      = { fg = "#${r.error}";   bg = "#${r.error}"; };
        marker_marked   = { fg = "#${r.accent}";  bg = "#${r.accent}"; };
        marker_selected = { fg = "#${r.accent}";  bg = "#${r.accent}"; };
        tab_active      = { fg = "#${r.bg}";      bg = "#${r.accent}"; };
        tab_inactive    = { fg = "#${r.text}";    bg = "#${r.surface}"; };
        border_symbol   = "│";
        border_style    = { fg = "#${r.subtle}"; };
      };
      status = {
        separator_open  = "";
        separator_close = "";
        separator_style = { fg = "#${r.surface}"; bg = "#${r.surface}"; };
        mode_normal = { fg = "#${r.bg}"; bg = "#${r.accent}";  bold = true; };
        mode_select = { fg = "#${r.bg}"; bg = "#${r.success}"; bold = true; };
        mode_unset  = { fg = "#${r.bg}"; bg = "#${r.error}";   bold = true; };
        progress_label  = { fg = "#${r.text}";   bold = true; };
        progress_normal = { fg = "#${r.accent}"; bg = "#${r.surface}"; };
        progress_error  = { fg = "#${r.error}";  bg = "#${r.surface}"; };
      };
      input = {
        border   = { fg = "#${r.accent}"; };
        title    = { fg = "#${r.accent}"; };
        value    = { fg = "#${r.text}"; };
        selected = { reversed = true; };
      };
      select = {
        border   = { fg = "#${r.accent}"; };
        active   = { fg = "#${r.accent}"; };
        inactive = { fg = "#${r.subtle}"; };
      };
    };
  };
}
