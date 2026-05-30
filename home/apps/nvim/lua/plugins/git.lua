-- home/apps/nvim/lua/plugins/git.lua
-- Git integration: sign column indicators and inline blame.
-- <leader>gs: stage | <leader>gr: reset | <leader>gp: preview | <leader>gb: blame | ]g/[g: next/prev hunk

require("gitsigns").setup({
  signs = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "‾" },
    changedelete = { text = "▎" },
    untracked    = { text = "▎" },
  },
  signs_staged = {
    add          = { text = "▎" },
    change       = { text = "▎" },
    delete       = { text = "" },
    topdelete    = { text = "‾" },
    changedelete = { text = "▎" },
  },
  signs_staged_enable = true,
  current_line_blame  = true,
  current_line_blame_opts = {
    delay         = 500,
    virt_text_pos = "eol",
  },
  current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> · <summary>",
  attach_to_untracked = true,
  on_attach = function(bufnr)
    local gs  = require("gitsigns")
    local map = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    -- ── Navigation ──────────────────────────────────────────────────────────
    map("n", "]g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gs.nav_hunk("next")
      end
    end, "Next hunk")

    map("n", "[g", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gs.nav_hunk("prev")
      end
    end, "Prev hunk")

    -- ── Actions ─────────────────────────────────────────────────────────────
    map("n", "<leader>gs", gs.stage_hunk,   "Stage hunk")
    map("n", "<leader>gr", gs.reset_hunk,   "Reset hunk")
    map("n", "<leader>gS", gs.stage_buffer, "Stage buffer")
    map("n", "<leader>gR", gs.reset_buffer, "Reset buffer")
    map("n", "<leader>gp", gs.preview_hunk, "Preview hunk")
    map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame line")
    map("n", "<leader>gd", gs.diffthis,     "Diff this")
    map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff this ~")

    -- ── Visual range ────────────────────────────────────────────────────────
    map("v", "<leader>gs", function()
      gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Stage hunk (range)")
    map("v", "<leader>gr", function()
      gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "Reset hunk (range)")

    -- ── Text object ─────────────────────────────────────────────────────────
    map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
  end,
})
