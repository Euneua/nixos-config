# Neovim via pkgs.wrapNeovim – plugins managed by Nix, Lua config lives in
# ~/.config/nvim/ (symlinked to ./lua/) and is loaded at runtime.
# Lua changes take effect immediately without a rebuild.
# Only plugin changes require nixos-rebuild.
{ pkgs, ... }:
let
  neovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
    configure = {
      # Load the Lua config from ~/.config/nvim/init.lua at runtime
      customRC = ''
        lua dofile(vim.fn.stdpath("config") .. "/init.lua")
      '';
      packages.all.start = with pkgs.vimPlugins; [
        # ── Theme ───────────────────────────────────────────────────────────
        catppuccin-nvim

        # ── UI ──────────────────────────────────────────────────────────────
        lualine-nvim
        bufferline-nvim
        which-key-nvim
        noice-nvim
        nvim-notify
        nvim-web-devicons
        neo-tree-nvim
        nui-nvim

        # ── Editor ──────────────────────────────────────────────────────────
        nvim-treesitter.withAllGrammars
        nvim-autopairs
        comment-nvim
        indent-blankline-nvim
        hardtime-nvim
        conform-nvim

        # ── Telescope ───────────────────────────────────────────────────────
        plenary-nvim
        telescope-nvim
        telescope-fzf-native-nvim

        # ── Git ─────────────────────────────────────────────────────────────
        gitsigns-nvim
        lazygit-nvim

        # ── LSP ─────────────────────────────────────────────────────────────
        nvim-lspconfig

        # ── Completion ──────────────────────────────────────────────────────
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
        cmp_luasnip
        luasnip
      ];
    };

    extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath (with pkgs; [
      nixd
      pyright
      nixfmt
      black
      lazygit
    ])}"'';
  };
in
{
  home.packages = [ neovim ];
}
