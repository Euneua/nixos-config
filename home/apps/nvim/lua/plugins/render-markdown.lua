-- home/apps/nvim/lua/plugins/render-markdown.lua
-- Markdown rendering: headings, code blocks, checkboxes, tables, links.
-- Only active in markdown and obsidian buffers.

require("render-markdown").setup({
  enabled    = true,
  file_types = { "markdown", "obsidian" },

  -- ── Headings ──────────────────────────────────────────────────────────────
  heading = {
    enabled    = true,
    sign       = false,
    position   = "overlay",
    icons      = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
    signs      = { "󰫎 " },
    width      = "full",
    left_pad   = 0,
    right_pad  = 0,
    min_width  = 0,
    border     = false,
    above      = "▄",
    below      = "▀",
    backgrounds = {
      "RenderMarkdownH1Bg",
      "RenderMarkdownH2Bg",
      "RenderMarkdownH3Bg",
      "RenderMarkdownH3Bg",
      "RenderMarkdownH3Bg",
      "RenderMarkdownH3Bg",
    },
    foregrounds = {
      "RenderMarkdownH1",
      "RenderMarkdownH2",
      "RenderMarkdownH3",
      "RenderMarkdownH4",
      "RenderMarkdownH5",
      "RenderMarkdownH6",
    },
  },

  -- ── Code Blocks ───────────────────────────────────────────────────────────
  code = {
    enabled       = true,
    sign          = false,
    style         = "full",
    position      = "left",
    language_pad  = 1,
    min_width     = 40,
    border        = "thin",
    above         = "▄",
    below         = "▀",
    highlight     = "RenderMarkdownCode",
    highlight_inline = "RenderMarkdownCodeInline",
  },

  -- ── Checkboxes ────────────────────────────────────────────────────────────
  checkbox = {
    enabled  = true,
    position = "overlay",
    unchecked = {
      icon      = "󰄱 ",
      highlight = "RenderMarkdownUnchecked",
    },
    checked = {
      icon      = "󰱒 ",
      highlight = "RenderMarkdownChecked",
    },
    custom = {
      in_progress = {
        raw       = "[-]",
        rendered  = "󰥔 ",
        highlight = "RenderMarkdownChecked",
      },
    },
  },

  -- ── Bullets ───────────────────────────────────────────────────────────────
  bullet = {
    enabled = true,
    icons   = { "●", "○", "◆", "◇" },
    highlight = "RenderMarkdownBullet",
  },

  -- ── Horizontal Rule ───────────────────────────────────────────────────────
  dash = {
    enabled   = true,
    icon      = "─",
    width     = "full",
    highlight = "RenderMarkdownDash",
  },

  -- ── Blockquotes ───────────────────────────────────────────────────────────
  quote = {
    enabled   = true,
    icon      = "▋",
    repeat_linebreak = false,
    highlight = "RenderMarkdownQuote",
  },

  -- ── Tables ────────────────────────────────────────────────────────────────
  pipe_table = {
    enabled   = true,
    preset    = "heavy",
    style     = "full",
    cell      = "padded",
    alignment_indicator = "━",
    head      = "RenderMarkdownTableHead",
    row       = "RenderMarkdownTableRow",
    filler    = "RenderMarkdownTableFill",
  },

  -- ── Links ─────────────────────────────────────────────────────────────────
  link = {
    enabled         = true,
    footnote        = { superscript = true, highlight = "RenderMarkdownLink" },
    image           = { icon = "󰥶 ", highlight = "RenderMarkdownLink" },
    email           = { icon = "󰀓 ", highlight = "RenderMarkdownLink" },
    hyperlink       = { icon = "󰌹 ", highlight = "RenderMarkdownLink" },
    wiki            = { icon = "󱗖 ", highlight = "RenderMarkdownLink" },
  },
})
