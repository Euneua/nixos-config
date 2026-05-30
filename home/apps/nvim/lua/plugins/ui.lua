-- home/apps/nvim/lua/plugins/ui.lua
-- UI: custom colorscheme from Nix-generated colors.lua, mini.statusline, mini.icons, which-key.

local c = dofile(vim.fn.stdpath("config") .. "/colors.lua")

-- ── Custom Colorscheme ────────────────────────────────────────────────────────
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.g.colors_name = "custom"
vim.opt.termguicolors = true

local h = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Base UI ───────────────────────────────────────────────────────────────────
h("Normal",       { fg = c.text,     bg = c.base })
h("NormalFloat",  { fg = c.text,     bg = c.mantle })
h("NormalNC",     { fg = c.subtext1, bg = c.base })
h("FloatBorder",  { fg = c.accent,   bg = c.mantle })
h("FloatTitle",   { fg = c.accent,   bg = c.mantle, bold = true })
h("Pmenu",        { fg = c.text,     bg = c.mantle })
h("PmenuSel",     { fg = c.base,     bg = c.accent, bold = true })
h("PmenuSbar",    { bg = c.surface0 })
h("PmenuThumb",   { bg = c.accent3 })

-- ── Cursor / Line ─────────────────────────────────────────────────────────────
h("CursorLine",   { bg = c.surface0 })
h("CursorLineNr", { fg = c.accent,   bold = true })
h("LineNr",       { fg = c.overlay1 })
h("ColorColumn",  { bg = c.surface0 })

-- ── Selection / Search ────────────────────────────────────────────────────────
h("Visual",       { bg = c.surface1 })
h("Search",       { fg = c.base, bg = c.accent_b, bold = true })
h("IncSearch",    { fg = c.base, bg = c.accent,   bold = true })
h("CurSearch",    { fg = c.base, bg = c.accent,   bold = true })

-- ── Splits / Borders ──────────────────────────────────────────────────────────
h("VertSplit",    { fg = c.surface2 })
h("WinSeparator", { fg = c.surface2 })

-- ── Status / Tab ──────────────────────────────────────────────────────────────
h("StatusLine",   { fg = c.subtext1, bg = c.mantle })
h("StatusLineNC", { fg = c.overlay1, bg = c.crust })
h("TabLine",      { fg = c.overlay1, bg = c.mantle })
h("TabLineSel",   { fg = c.text,     bg = c.surface1, bold = true })
h("TabLineFill",  { bg = c.crust })

-- ── Fold / Sign Column ────────────────────────────────────────────────────────
h("SignColumn",   { fg = c.overlay1, bg = c.base })
h("FoldColumn",   { fg = c.overlay0, bg = c.base })
h("Folded",       { fg = c.overlay2, bg = c.surface0 })

-- ── Messages / Cmdline ────────────────────────────────────────────────────────
h("MsgArea",      { fg = c.subtext0 })
h("ErrorMsg",     { fg = c.error })
h("WarningMsg",   { fg = c.warning })
h("Question",     { fg = c.info })
h("ModeMsg",      { fg = c.accent,   bold = true })
h("MoreMsg",      { fg = c.success })

-- ── Syntax ────────────────────────────────────────────────────────────────────
h("Comment",      { fg = c.syn_comment,    italic = true })
h("String",       { fg = c.syn_string })
h("Character",    { fg = c.syn_string })
h("Number",       { fg = c.syn_number })
h("Float",        { fg = c.syn_number })
h("Boolean",      { fg = c.syn_number })
h("Identifier",   { fg = c.text })
h("Function",     { fg = c.syn_func,       bold = true })
h("Keyword",      { fg = c.syn_keyword,    bold = true })
h("Conditional",  { fg = c.syn_keyword,    bold = true })
h("Repeat",       { fg = c.syn_keyword,    bold = true })
h("Operator",     { fg = c.syn_operator })
h("Type",         { fg = c.syn_type,       bold = true })
h("StorageClass", { fg = c.syn_type })
h("Structure",    { fg = c.syn_type })
h("Typedef",      { fg = c.syn_type })
h("Statement",    { fg = c.syn_keyword })
h("PreProc",      { fg = c.syn_attribute })
h("Include",      { fg = c.syn_attribute })
h("Define",       { fg = c.syn_attribute })
h("Macro",        { fg = c.syn_attribute })
h("Constant",     { fg = c.syn_constant })
h("Special",      { fg = c.syn_attribute })
h("SpecialChar",  { fg = c.syn_string })
h("Delimiter",    { fg = c.syn_punctuation })
h("Tag",          { fg = c.link })
h("Underlined",   { fg = c.link,           underline = true })
h("Error",        { fg = c.error,          bold = true })
h("Todo",         { fg = c.syn_number,     bg = c.surface1, bold = true })
h("Title",        { fg = c.accent,         bold = true })
h("NonText",      { fg = c.overlay0 })
h("SpecialKey",   { fg = c.overlay0 })
h("Whitespace",   { fg = c.surface2 })
h("Conceal",      { fg = c.overlay1 })
h("SpellBad",     { undercurl = true, sp = c.error })
h("SpellCap",     { undercurl = true, sp = c.warning })
h("SpellRare",    { undercurl = true, sp = c.info })
h("SpellLocal",   { undercurl = true, sp = c.success })

-- ── Treesitter ────────────────────────────────────────────────────────────────
h("@comment",               { fg = c.syn_comment,    italic = true })
h("@string",                { fg = c.syn_string })
h("@string.escape",         { fg = c.syn_constant })
h("@string.special",        { fg = c.syn_constant })
h("@number",                { fg = c.syn_number })
h("@float",                 { fg = c.syn_number })
h("@boolean",               { fg = c.syn_number })
h("@character",             { fg = c.syn_string })
h("@variable",              { fg = c.text })
h("@variable.builtin",      { fg = c.syn_constant,   italic = true })
h("@variable.parameter",    { fg = c.subtext1 })
h("@variable.member",       { fg = c.subtext1 })
h("@function",              { fg = c.syn_func,        bold = true })
h("@function.builtin",      { fg = c.syn_func,        bold = true })
h("@function.call",         { fg = c.syn_func_call })
h("@function.method",       { fg = c.syn_func,        bold = true })
h("@function.method.call",  { fg = c.syn_func_call })
h("@constructor",           { fg = c.syn_type,        bold = true })
h("@keyword",               { fg = c.syn_keyword,     bold = true })
h("@keyword.import",        { fg = c.syn_keyword })
h("@keyword.return",        { fg = c.syn_keyword,     bold = true })
h("@keyword.operator",      { fg = c.syn_operator })
h("@keyword.exception",     { fg = c.error,           bold = true })
h("@operator",              { fg = c.syn_operator })
h("@punctuation.delimiter", { fg = c.syn_punctuation })
h("@punctuation.bracket",   { fg = c.syn_punctuation })
h("@punctuation.special",   { fg = c.syn_punctuation })
h("@type",                  { fg = c.syn_type,        bold = true })
h("@type.builtin",          { fg = c.syn_type,        italic = true })
h("@attribute",             { fg = c.syn_attribute })
h("@namespace",             { fg = c.syn_namespace })
h("@constant",              { fg = c.syn_constant })
h("@constant.builtin",      { fg = c.syn_constant,    italic = true })
h("@tag",                   { fg = c.syn_keyword })
h("@tag.attribute",         { fg = c.syn_attribute })
h("@tag.delimiter",         { fg = c.syn_punctuation })

-- ── Markup (Markdown Treesitter) ──────────────────────────────────────────────
h("@markup.heading.1",      { fg = c.syn_md_h1, bold = true })
h("@markup.heading.2",      { fg = c.syn_md_h2, bold = true })
h("@markup.heading.3",      { fg = c.syn_md_h3, bold = true })
h("@markup.heading.4",      { fg = c.syn_md_h4, bold = true })
h("@markup.heading.5",      { fg = c.syn_md_h4 })
h("@markup.heading.6",      { fg = c.syn_md_h4 })
h("@markup.raw.inline",     { fg = c.syn_md_code, bg = c.syn_md_code_bg })
h("@markup.raw.block",      { fg = c.syn_md_code })
h("@markup.quote",          { fg = c.syn_md_quote, italic = true })
h("@markup.list",           { fg = c.syn_md_list })
h("@markup.list.checked",   { fg = c.syn_md_checkbox_on })
h("@markup.list.unchecked", { fg = c.syn_md_checkbox_off })
h("@markup.strong",         { fg = c.syn_md_bold,   bold = true })
h("@markup.italic",         { fg = c.syn_md_italic, italic = true })
h("@markup.link",           { fg = c.syn_md_link,   underline = true })
h("@markup.link.url",       { fg = c.syn_md_url,    underline = true })
h("@markup.link.label",     { fg = c.syn_md_link })
h("@markup.strikethrough",  { strikethrough = true })

-- ── Diagnostics ───────────────────────────────────────────────────────────────
h("DiagnosticError",              { fg = c.error })
h("DiagnosticWarn",               { fg = c.warning })
h("DiagnosticInfo",               { fg = c.info })
h("DiagnosticHint",               { fg = c.success })
h("DiagnosticOk",                 { fg = c.success })
h("DiagnosticUnderlineError",     { undercurl = true, sp = c.error })
h("DiagnosticUnderlineWarn",      { undercurl = true, sp = c.warning })
h("DiagnosticUnderlineInfo",      { undercurl = true, sp = c.info })
h("DiagnosticUnderlineHint",      { undercurl = true, sp = c.success })
h("DiagnosticVirtualTextError",   { fg = c.error,   bg = c.crust, italic = true })
h("DiagnosticVirtualTextWarn",    { fg = c.warning, bg = c.crust, italic = true })
h("DiagnosticVirtualTextInfo",    { fg = c.info,    bg = c.crust, italic = true })
h("DiagnosticVirtualTextHint",    { fg = c.success, bg = c.crust, italic = true })
h("DiagnosticSignError",          { fg = c.error })
h("DiagnosticSignWarn",           { fg = c.warning })
h("DiagnosticSignInfo",           { fg = c.info })
h("DiagnosticSignHint",           { fg = c.success })

-- ── LSP ───────────────────────────────────────────────────────────────────────
h("LspReferenceText",  { bg = c.surface1 })
h("LspReferenceRead",  { bg = c.surface1 })
h("LspReferenceWrite", { bg = c.surface1, bold = true })
h("LspInlayHint",      { fg = c.overlay0, bg = c.crust, italic = true })

-- ── Gitsigns ──────────────────────────────────────────────────────────────────
h("GitSignsAdd",             { fg = c.success })
h("GitSignsChange",          { fg = c.warning })
h("GitSignsDelete",          { fg = c.error })
h("GitSignsCurrentLineBlame",{ fg = c.overlay0, italic = true })

-- ── Telescope ─────────────────────────────────────────────────────────────────
h("TelescopeBorder",         { fg = c.surface2, bg = c.mantle })
h("TelescopeNormal",         { fg = c.text,     bg = c.mantle })
h("TelescopePromptBorder",   { fg = c.accent,   bg = c.crust })
h("TelescopePromptNormal",   { fg = c.text,     bg = c.crust })
h("TelescopePromptPrefix",   { fg = c.accent })
h("TelescopeSelection",      { fg = c.text,     bg = c.surface0, bold = true })
h("TelescopeSelectionCaret", { fg = c.accent })
h("TelescopeMatching",       { fg = c.syn_number, bold = true })
h("TelescopePreviewBorder",  { fg = c.surface2, bg = c.mantle })
h("TelescopeResultsBorder",  { fg = c.surface2, bg = c.mantle })
h("TelescopeTitle",          { fg = c.accent,   bold = true })

-- ── Indent Blankline ──────────────────────────────────────────────────────────
h("IblIndent", { fg = c.surface2 })
h("IblScope",  { fg = c.accent3 })

-- ── Trouble ───────────────────────────────────────────────────────────────────
h("TroubleNormal",      { fg = c.text,     bg = c.mantle })
h("TroubleCount",       { fg = c.syn_number, bg = c.surface0, bold = true })
h("TroubleError",       { fg = c.error })
h("TroubleWarning",     { fg = c.warning })
h("TroubleInformation", { fg = c.info })
h("TroubleHint",        { fg = c.success })

-- ── Which-key ─────────────────────────────────────────────────────────────────
h("WhichKey",          { fg = c.accent })
h("WhichKeyGroup",     { fg = c.accent2 })
h("WhichKeyDesc",      { fg = c.subtext1 })
h("WhichKeyBorder",    { fg = c.surface2 })
h("WhichKeySeparator", { fg = c.overlay0 })
h("WhichKeyFloat",     { bg = c.mantle })
h("WhichKeyValue",     { fg = c.overlay2 })

-- ── Blink CMP ─────────────────────────────────────────────────────────────────
h("BlinkCmpMenu",                { fg = c.text,       bg = c.mantle })
h("BlinkCmpMenuBorder",          { fg = c.surface2,   bg = c.mantle })
h("BlinkCmpMenuSelection",       { fg = c.base,       bg = c.accent, bold = true })
h("BlinkCmpScrollBarThumb",      { bg = c.accent3 })
h("BlinkCmpScrollBarGutter",     { bg = c.surface0 })
h("BlinkCmpLabel",               { fg = c.text })
h("BlinkCmpLabelMatch",          { fg = c.syn_number, bold = true })
h("BlinkCmpKind",                { fg = c.accent2 })
h("BlinkCmpGhostText",           { fg = c.overlay0,   italic = true })
h("BlinkCmpDoc",                 { fg = c.text,       bg = c.mantle })
h("BlinkCmpDocBorder",           { fg = c.surface2,   bg = c.mantle })
h("BlinkCmpDocSeparator",        { fg = c.surface2 })
h("BlinkCmpSignatureHelp",       { fg = c.text,       bg = c.mantle })
h("BlinkCmpSignatureHelpBorder", { fg = c.surface2,   bg = c.mantle })

-- ── Oil ───────────────────────────────────────────────────────────────────────
h("OilDir",        { fg = c.syn_func,    bold = true })
h("OilDirIcon",    { fg = c.syn_func })
h("OilFile",       { fg = c.text })
h("OilLink",       { fg = c.link,        italic = true })
h("OilLinkTarget", { fg = c.link2 })
h("OilPermission", { fg = c.overlay1 })
h("OilSize",       { fg = c.overlay1 })
h("OilMtime",      { fg = c.overlay0 })
h("OilCopy",       { fg = c.success })
h("OilMove",       { fg = c.warning })
h("OilDelete",     { fg = c.error })
h("OilCreate",     { fg = c.info })
h("OilChange",     { fg = c.caution })

-- ── Flash ─────────────────────────────────────────────────────────────────────
h("FlashLabel",    { fg = c.base, bg = c.accent,   bold = true })
h("FlashCurrent",  { fg = c.base, bg = c.syn_number, bold = true })
h("FlashMatch",    { fg = c.base, bg = c.accent3 })
h("FlashBackdrop", { fg = c.overlay0 })

-- ── Todo Comments ─────────────────────────────────────────────────────────────
h("TodoFgTODO",  { fg = c.syn_number, bold = true })
h("TodoFgFIXME", { fg = c.error,      bold = true })
h("TodoFgNOTE",  { fg = c.info,       bold = true })
h("TodoFgHACK",  { fg = c.warning,    bold = true })
h("TodoFgWARN",  { fg = c.warning,    bold = true })
h("TodoBgTODO",  { fg = c.base, bg = c.syn_number, bold = true })
h("TodoBgFIXME", { fg = c.base, bg = c.error,      bold = true })
h("TodoBgNOTE",  { fg = c.base, bg = c.info,        bold = true })
h("TodoBgHACK",  { fg = c.base, bg = c.warning,     bold = true })

-- ── Harpoon ───────────────────────────────────────────────────────────────────
h("HarpoonBorder", { fg = c.surface2, bg = c.mantle })
h("HarpoonWindow", { fg = c.text,     bg = c.mantle })

-- ── Render Markdown ───────────────────────────────────────────────────────────
h("RenderMarkdownH1",       { fg = c.syn_md_h1, bold = true })
h("RenderMarkdownH2",       { fg = c.syn_md_h2, bold = true })
h("RenderMarkdownH3",       { fg = c.syn_md_h3, bold = true })
h("RenderMarkdownH4",       { fg = c.syn_md_h4, bold = true })
h("RenderMarkdownH5",       { fg = c.syn_md_h4 })
h("RenderMarkdownH6",       { fg = c.syn_md_h4 })
h("RenderMarkdownCode",     { bg = c.syn_md_code_bg })
h("RenderMarkdownCodeInline",{ fg = c.syn_md_code, bg = c.syn_md_code_bg })
h("RenderMarkdownBullet",   { fg = c.syn_md_list })
h("RenderMarkdownQuote",    { fg = c.syn_md_quote, italic = true })
h("RenderMarkdownDash",     { fg = c.syn_md_hr })
h("RenderMarkdownLink",     { fg = c.syn_md_link, underline = true })
h("RenderMarkdownChecked",  { fg = c.syn_md_checkbox_on })
h("RenderMarkdownUnchecked",{ fg = c.syn_md_checkbox_off })
h("RenderMarkdownH1Bg",     { bg = c.surface0 })
h("RenderMarkdownH2Bg",     { bg = c.surface0 })
h("RenderMarkdownH3Bg",     { bg = c.surface0 })
h("RenderMarkdownTableHead", { fg = c.accent,   bg = c.surface0, bold = true })
h("RenderMarkdownTableRow",  { fg = c.text,      bg = c.mantle })
h("RenderMarkdownTableFill", { fg = c.surface2,  bg = c.mantle })

-- ── Mini Statusline ───────────────────────────────────────────────────────────
h("MiniStatuslineModeNormal",  { fg = c.base, bg = c.accent,   bold = true })
h("MiniStatuslineModeInsert",  { fg = c.base, bg = c.success,  bold = true })
h("MiniStatuslineModeVisual",  { fg = c.base, bg = c.syn_number, bold = true })
h("MiniStatuslineModeReplace", { fg = c.base, bg = c.error,    bold = true })
h("MiniStatuslineModeCommand", { fg = c.base, bg = c.warning,  bold = true })
h("MiniStatuslineModeOther",   { fg = c.base, bg = c.info,     bold = true })
h("MiniStatuslineFilename",    { fg = c.subtext1, bg = c.surface0 })
h("MiniStatuslineFileinfo",    { fg = c.overlay1, bg = c.surface0 })
h("MiniStatuslineDevinfo",     { fg = c.overlay2, bg = c.surface0 })
h("MiniStatuslineInactive",    { fg = c.overlay0, bg = c.crust })

-- ── Icons ─────────────────────────────────────────────────────────────────────
require("mini.icons").setup()

-- ── Statusline ────────────────────────────────────────────────────────────────
local statusline = require("mini.statusline")

statusline.setup({
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
      local git           = statusline.section_git({ trunc_width = 75 })
      local diagnostics   = statusline.section_diagnostics({ trunc_width = 75 })
      local filename      = statusline.section_filename({ trunc_width = 140 })
      local fileinfo      = statusline.section_fileinfo({ trunc_width = 120 })
      local location      = statusline.section_location({ trunc_width = 75 })

      -- LSP name – only show if an LSP is attached
      local lsp = ""
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients > 0 then
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        lsp = " " .. table.concat(names, ", ")
      end

      -- Encoding – only show if not utf-8
      local encoding = ""
      local enc = vim.opt.fileencoding:get()
      if enc ~= "" and enc ~= "utf-8" then
        encoding = enc
      end

      return statusline.combine_groups({
        { hl = mode_hl,                   strings = { mode } },
        { hl = "MiniStatuslineDevinfo",   strings = { git, diagnostics } },
        "%<",
        { hl = "MiniStatuslineFilename",  strings = { filename } },
        "%=",
        { hl = "MiniStatuslineDevinfo",   strings = { lsp } },
        { hl = "MiniStatuslineFileinfo",  strings = { encoding, fileinfo } },
        { hl = mode_hl,                   strings = { location } },
      })
    end,

    inactive = function()
      return statusline.combine_groups({
        { hl = "MiniStatuslineInactive", strings = { statusline.section_filename({ trunc_width = 88 }) } },
      })
    end,
  },
  use_icons    = true,
  set_vim_settings = true,
})

-- ── Which-key ─────────────────────────────────────────────────────────────────
require("which-key").setup({
  delay = 300,
  icons = {
    mappings = true,
    keys = {
      Space = "󱁐 ",
      CR    = "↵ ",
      Esc   = "⎋ ",
      Tab   = "⇥ ",
      BS    = "⌫ ",
    },
  },
  spec = {
    { "<leader>f", group = "find" },
    { "<leader>g", group = "git" },
    { "<leader>x", group = "diagnostics" },
    { "<leader>s", group = "splits" },
    { "<leader>b", group = "buffer" },
    { "<leader>c", group = "code" },
    { "<leader>o", group = "obsidian" },
  },
})
