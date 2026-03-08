# nvim/plugins/cmp.nix
# Autocompletion configuration using nvim-cmp.
# Sources: LSP, buffer words, file paths and snippets.
# Ctrl+Space: open suggestions | Enter: confirm | Tab/Shift+Tab: navigate | Ctrl+e: close

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    # ── Completion Engine ────────────────────────────────────────────────────────
    cmp = {
      enable = true;
      settings = {
        # Sources define where completion suggestions come from (priority: top to bottom)
        sources = [
          { name = "nvim_lsp"; } # Suggestions from the active LSP server
          { name = "buffer"; }   # Words from the current buffer
          { name = "path"; }     # File system paths
          { name = "luasnip"; }  # Code snippets via LuaSnip
        ];
        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<CR>"      = "cmp.mapping.confirm({ select = true })";
          "<Tab>"     = "cmp.mapping.select_next_item()";
          "<S-Tab>"   = "cmp.mapping.select_prev_item()";
          "<C-e>"     = "cmp.mapping.abort()";
        };
      };
    };

    # ── Supporting Plugins ───────────────────────────────────────────────────────
    luasnip.enable    = true; # Snippet engine required by cmp
    cmp-nvim-lsp.enable = true; # Connects LSP suggestions to cmp
    cmp-buffer.enable = true; # Enables buffer words as a cmp source
    cmp-path.enable   = true; # Enables file paths as a cmp source
  };
}
