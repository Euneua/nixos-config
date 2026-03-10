-- gd: definition | gr: references | K: hover | <leader>ca: code action | <leader>rn: rename
vim.lsp.config("nixd", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.config("pyright", {
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable({ "nixd", "pyright" })