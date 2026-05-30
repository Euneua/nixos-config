-- home/apps/nvim/lua/plugins/obsidian.lua
-- Obsidian vault integration: backlinks, daily notes, wikilinks, search.
-- Vault lives at ~/notes/

require("obsidian").setup({
  workspaces = {
    {
      name = "notes",
      path = "~/notes",
    },
  },

  -- Daily notes
  daily_notes = {
    folder       = "daily",
    date_format  = "%Y-%m-%d",
    alias_format = "%B %-d, %Y",
    default_tags = { "daily" },
    template     = "daily.md",
  },

  legacy_commands = false,

  -- Completion via blink.cmp
  completion = {
    nvim_cmp  = false,
    min_chars = 2,
  },

  -- Use telescope for search
  picker = {
    name = "telescope.nvim",
  },

  -- UI handled by render-markdown + our own theme
  ui = {
    enable = false,
  },

  -- Frontmatter
  frontmatter = {
    func = function(note)
      local out = { id = note.id, tags = note.tags }
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,
  },

  -- Note ID from title
  note_id_func = function(title)
    local suffix = ""
    if title ~= nil then
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,

  attachments = {
    folder = "assets",
  },

  -- Keymaps – only active inside obsidian notes
  callbacks = {
    enter_note = function()
      local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = true, desc = desc })
      end
      local actions = require("obsidian.actions")

      map("<leader>on", "<cmd>Obsidian new<cr>",          "new note")
      map("<leader>od", "<cmd>Obsidian today<cr>",        "open daily note")
      map("<leader>ob", "<cmd>Obsidian backlinks<cr>",    "backlinks")
      map("<leader>of", "<cmd>Obsidian search<cr>",       "find note")
      map("<leader>ot", "<cmd>Obsidian tags<cr>",         "tags")
      map("<leader>ol", "<cmd>Obsidian link<cr>",         "insert link")
      map("<leader>oo", "<cmd>Obsidian open<cr>",         "open in obsidian app")
      map("<CR>",       require("obsidian.api").smart_action, "smart action")
      map("<Tab>", function() actions.nav_link("next") end, "next link")
      map("<S-Tab>", function() actions.nav_link("prev") end, "prev link")
    end,
  },
})
