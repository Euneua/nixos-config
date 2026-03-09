-- Ctrl+Space: open | Enter: confirm | Tab/S-Tab: navigate | Ctrl+e: close
local cmp     = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },  -- Suggestions from the active LSP server
    { name = "buffer" },    -- Words from the current buffer
    { name = "path" },      -- File system paths
    { name = "luasnip" },   -- Code snippets via LuaSnip
  }),
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    ["<Tab>"]     = cmp.mapping.select_next_item(),
    ["<S-Tab>"]   = cmp.mapping.select_prev_item(),
    ["<C-e>"]     = cmp.mapping.abort(),
  }),
})
