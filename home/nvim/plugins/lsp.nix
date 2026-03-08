# nvim/plugins/lsp.nix
# Language Server Protocol configuration.
# Provides IDE features: autocompletion, error highlighting, go-to-definition and hover docs.
# Keybinds: gd (definition) | gr (references) | K (hover) | <leader>ca (code action) | <leader>rn (rename)
# See keymaps.nix for the full LSP keybinding definitions.

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      servers = {
        # Nix LSP – autocompletion and error highlighting for .nix files
        nixd.enable = true;
        # Python LSP by Microsoft – type checking, autocompletion and error highlighting for .py files
        pyright.enable = true;
      };
    };
  };
}
