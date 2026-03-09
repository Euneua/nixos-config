# Neovim via Home Manager – plugins managed by Nix, config written in Lua.
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;

    plugins = with pkgs.vimPlugins; [
      # ── Theme ─────────────────────────────────────────────────────────────
      catppuccin-nvim

      # ── UI ────────────────────────────────────────────────────────────────
      lualine-nvim
      bufferline-nvim
      which-key-nvim
      noice-nvim
      nvim-notify
      nvim-web-devicons
      neo-tree-nvim
      nui-nvim          # required by noice and neo-tree

      # ── Editor ────────────────────────────────────────────────────────────
      nvim-treesitter.withAllGrammars
      nvim-autopairs
      comment-nvim
      indent-blankline-nvim
      hardtime-nvim
      conform-nvim

      # ── Telescope ─────────────────────────────────────────────────────────
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim

      # ── Git ───────────────────────────────────────────────────────────────
      gitsigns-nvim
      lazygit-nvim

      # ── LSP ───────────────────────────────────────────────────────────────
      nvim-lspconfig

      # ── Completion ────────────────────────────────────────────────────────
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp_luasnip
      luasnip
    ];

    # Tools available in Neovim's PATH
    extraPackages = with pkgs; [
      nixd              # Nix LSP
      pyright           # Python LSP
      nixfmt            # Nix formatter
      black             # Python formatter
      lazygit           # Git TUI
    ];

    initLua = ''
      ${builtins.readFile ./lua/options.lua}
      ${builtins.readFile ./lua/keymaps.lua}
      ${builtins.readFile ./lua/plugins/ui.lua}
      ${builtins.readFile ./lua/plugins/editor.lua}
      ${builtins.readFile ./lua/plugins/telescope.lua}
      ${builtins.readFile ./lua/plugins/git.lua}
      ${builtins.readFile ./lua/plugins/lsp.lua}
      ${builtins.readFile ./lua/plugins/cmp.lua}
    '';
  };
}
