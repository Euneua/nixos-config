# nvim/plugins/telescope.nix
# Telescope fuzzy finder configuration.
# <leader>ff: find files | <leader>fg: live grep | <leader>fb: buffers | <leader>fh: help tags
# See keymaps.nix for the full Telescope keybinding definitions.

{ config, pkgs, ... }:
{
  programs.nixvim.plugins = {
    telescope = {
      enable = true;
      extensions = {
        # Native C extension for significantly faster fuzzy matching on large file lists
        fzf-native.enable = true;
      };
    };
  };
}
