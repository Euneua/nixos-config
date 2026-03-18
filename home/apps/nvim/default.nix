# home/apps/nvim/default.nix
# Neovim via pkgs.wrapNeovim – plugins managed by Nix, Lua config lives in
# ~/.config/nvim/ (symlinked to ./lua/) and is loaded at runtime.
# Lua changes take effect immediately without a rebuild.
# Only plugin changes require nixos-rebuild.

{ pkgs, ... }:
let
  neovim = pkgs.wrapNeovim pkgs.neovim-unwrapped {
    configure = {
      customRC = ''
        lua dofile(vim.fn.stdpath("config") .. "/init.lua")
      '';

      packages.all.start = with pkgs.vimPlugins; [
        # ── Theme ─────────────────────────────────────────────────────────
        catppuccin-nvim

        # ── UI ────────────────────────────────────────────────────────────
        lualine-nvim
        which-key-nvim
        mini-nvim
        nui-nvim

        # ── Editor ────────────────────────────────────────────────────────
        nvim-treesitter.withAllGrammars
        nvim-autopairs
        indent-blankline-nvim
        hardtime-nvim
        conform-nvim
        nvim-surround
        todo-comments-nvim

        # ── Navigation ────────────────────────────────────────────────────
        flash-nvim
        harpoon2

        # ── File Manager ──────────────────────────────────────────────────
        oil-nvim

        # ── Telescope ─────────────────────────────────────────────────────
        plenary-nvim
        telescope-nvim
        telescope-fzf-native-nvim

        # ── Git ───────────────────────────────────────────────────────────
        gitsigns-nvim

        # ── LSP ───────────────────────────────────────────────────────────
        nvim-lspconfig

        # ── Completion ────────────────────────────────────────────────────
        blink-cmp
        luasnip

        # ── Diagnostics ───────────────────────────────────────────────────
        trouble-nvim
      ];
    };

    extraMakeWrapperArgs = "--prefix PATH : ${
      pkgs.lib.makeBinPath (
        with pkgs;
        [
          nixd
          pyright
          rust-analyzer
          lua-language-server
          taplo
          nixfmt
          black
          rustfmt
          stylua
          wl-clipboard
        ]
      )
    }";
  };
in
{
  home.packages = [ neovim ];

  # Symlink the Lua config to ~/.config/nvim so Neovim finds it at runtime
  home.file.".config/nvim" = {
    source = ./lua;
    recursive = true;
  };
}
