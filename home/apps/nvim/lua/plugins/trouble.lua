-- home/apps/nvim/lua/plugins/trouble.lua
-- Diagnostics panel via trouble.nvim v3.
-- <leader>xx: diagnostics | <leader>xb: buffer | <leader>xs: symbols | <leader>xr: LSP refs | <leader>xq: quickfix

require("trouble").setup({
  modes = {
    diagnostics = {
      mode   = "diagnostics",
      filter = { buf = 0, range = false },
      focus  = false,
      win = {
        position = "bottom",
        size     = 12,
      },
    },
    symbols = {
      mode  = "lsp_document_symbols",
      focus = false,
      win = {
        position = "right",
        size     = 40,
      },
    },
  },
  icons = {
    indent = {
      top         = "│ ",
      middle      = "├╴",
      last        = "└╴",
      fold_open   = " ",
      fold_closed = " ",
      ws          = "  ",
    },
    folder_closed = " ",
    folder_open   = " ",
    kinds = {
      Array         = " ",
      Boolean       = "󰨙 ",
      Class         = " ",
      Constant      = "󰏿 ",
      Constructor   = " ",
      Enum          = " ",
      EnumMember    = " ",
      Event         = " ",
      Field         = " ",
      File          = " ",
      Function      = "󰊕 ",
      Interface     = " ",
      Key           = " ",
      Method        = "󰊕 ",
      Module        = " ",
      Namespace     = "󰦮 ",
      Null          = " ",
      Number        = "󰎠 ",
      Object        = " ",
      Operator      = " ",
      Package       = " ",
      Property      = " ",
      String        = " ",
      Struct        = "󰆼 ",
      TypeParameter = " ",
      Variable      = "󰀫 ",
    },
  },
})
