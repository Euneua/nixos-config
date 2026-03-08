# nvim/plugins/editor.nix
# Core editor plugins for syntax highlighting, formatting and navigation.

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    # ── Syntax ──────────────────────────────────────────────────────────────────
    # Parses code into a syntax tree for precise highlighting and better code understanding
    treesitter = {
      enable = true;
      settings.highlight.enable = true;
    };

    # ── Editing Helpers ─────────────────────────────────────────────────────────
    # Automatically closes brackets, quotes etc. – ( becomes ()
    autopairs.enable = true;
    # gcc: comment a line | gc in visual mode: comment a block
    comment.enable = true;
    # Disabled – was overriding the d operator which broke dw, dd etc.
    vim-surround.enable = false;

    # ── Visual Aids ─────────────────────────────────────────────────────────────
    # Vertical indent guide lines to visualize code block structure
    indent-blankline.enable = true;

    # ── Navigation ──────────────────────────────────────────────────────────────
    # Forces better Vim habits by blocking repeated use of the same motion key
    hardtime.enable = true;

    # ── Formatting ──────────────────────────────────────────────────────────────
    # Auto-formatter: formats on <leader>cf (see keymaps.nix)
    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        nix    = [ "nixfmt" ];
        python = [ "black" ];
      };
    };
  };
}
