-- home/apps/nvim/lua/plugins/lsp.lua
-- LSP configuration: nixd, pyright, rust-analyzer, lua_ls, taplo, ts_ls, svelte.
-- gd: definition | gr: references | K: hover | <leader>ca: code action | <leader>rn: rename

-- ── Diagnostic display ────────────────────────────────────────────────────────
vim.diagnostic.config({
  virtual_text = {
    prefix  = "●",
    spacing = 4,
    source  = "if_many",
  },
  float = {
    border = "rounded",
    source = true,
    header = "",
    prefix = "",
  },
  signs            = true,
  underline        = true,
  update_in_insert = false,
  severity_sort    = true,
})

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
      checkOnSave = { command = "clippy" },
      inlayHints  = { enable = true },
    },
  },
})

-- ── Lua ───────────────────────────────────────────────────────────────────────
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime  = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("", true),
      },
      diagnostics = { globals = { "vim" } },
      telemetry   = { enable = false },
    },
  },
})

-- ── TOML ──────────────────────────────────────────────────────────────────────
vim.lsp.config("taplo", {
  capabilities = capabilities,
})

-- ── TypeScript ────────────────────────────────────────────────────────────────
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
})

-- ── Svelte ────────────────────────────────────────────────────────────────────
vim.lsp.config("svelte", {
  capabilities = capabilities,
})

vim.lsp.enable({ "nixd", "pyright", "rust_analyzer", "lua_ls", "taplo", "ts_ls", "svelte" })
