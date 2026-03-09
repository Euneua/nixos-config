-- <leader>ff: find files | <leader>fg: live grep | <leader>fb: buffers | <leader>fh: help tags
local telescope = require("telescope")

telescope.setup({})

-- Native C extension for significantly faster fuzzy matching on large file lists
telescope.load_extension("fzf")
