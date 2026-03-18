-- home/apps/nvim/lua/plugins/cmp.lua
-- Autocompletion via blink.cmp with LuaSnip snippet support.
-- Tab/S-Tab: navigate | Enter: confirm | Ctrl+e: cancel | Ctrl+Space: open

require("blink.cmp").setup({
  keymap = {
    preset       = "none",
    ["<C-Space>"] = { "show", "fallback" },
    ["<CR>"]      = { "accept", "fallback" },
    ["<C-e>"]     = { "cancel", "fallback" },
    ["<Tab>"]     = { "select_next", "fallback" },
    ["<S-Tab>"]   = { "select_prev", "fallback" },
    ["<C-d>"]     = { "scroll_documentation_down", "fallback" },
    ["<C-u>"]     = { "scroll_documentation_up", "fallback" },
  },

  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant        = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  snippets = {
    preset = "luasnip",
  },

  completion = {
    documentation = {
      auto_show       = true,   -- Automatically show docs popup
      auto_show_delay_ms = 200,
    },
    ghost_text = {
      enabled = true,           -- Show completion inline as ghost text
    },
    menu = {
      draw = {
        treesitter = { "lsp" }, -- Treesitter highlighting in completion menu
      },
    },
  },

  signature = {
    enabled = true,  -- Show function signature while typing
  },
})
