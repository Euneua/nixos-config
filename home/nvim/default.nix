# nvim/default.nix
# Entry point for the Neovim configuration via NixVim.
# Imports all sub-modules and sets the Catppuccin Mocha colorscheme.

{ config, pkgs, ... }:
{
  imports = [
    ./options.nix        # Editor options (line numbers, indentation, etc.)
    ./keymaps.nix        # Keybindings
    ./plugins/ui.nix     # UI plugins (statusline, bufferline, file tree, etc.)
    ./plugins/editor.nix # Editor plugins (autopairs, surround, comments, etc.)
    ./plugins/telescope.nix # Fuzzy finder
    ./plugins/git.nix    # Git integration (gitsigns, lazygit)
    ./plugins/lsp.nix    # Language Server Protocol (nixd, pyright)
    ./plugins/cmp.nix    # Autocompletion
  ];

  programs.nixvim = {
    enable = true;
    # Catppuccin Mocha: dark theme with purple/blue accents matching the system theme
    colorschemes.catppuccin = {
      enable           = true;
      settings.flavour = "mocha";
    };
  };
}
