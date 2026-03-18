-- home/apps/nvim/lua/plugins/lsp.lua
-- LSP configuration: nixd, pyright, rust-analyzer, lua_ls, taplo.
-- gd: definition | gr: references | K: hover | <leader>ca: code action | <leader>rn: rename

local capabilities = require("blink.cmp").get_lsp_capabilities()

-- ── Nix ───────────────────────────────────────────────────────────────────────
vim.lsp.config("nixd", {
  capabilities = capabilities,
})

-- ── Python ────────────────────────────────────────────────────────────────────
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

-- ── Rust ──────────────────────────────────────────────────────────────────────
vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave    = { command = "clippy" },  -- Use clippy instead of check
      inlayHints     = { enable = true },       -- Show type hints inline
    },
  },
})

-- ── Lua ───────────────────────────────────────────────────────────────────────
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime  = { version = "LuaJIT" },   -- Neovim uses LuaJIT
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),  -- Neovim runtime files
      },
      diagnostics = { globals = { "vim" } },  -- Don't warn about vim global
      telemetry   = { enable = false },
    },
  },
})

-- ── TOML ──────────────────────────────────────────────────────────────────────
vim.lsp.config("taplo", {
  capabilities = capabilities,
})

vim.lsp.enable({ "nixd", "pyright", "rust_analyzer", "lua_ls", "taplo" })
