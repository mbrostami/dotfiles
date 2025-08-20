-- ~/.config/nvim/lua/config/keymaps.lua

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Command + [  → jump back in location list
map("n", "<Esc>bb", "<C-o>", opts)

-- Command + ] → jump forward in location list
map("n", "<Esc>ff", "<C-i>", opts)

-- Command + E → open recent files (Telescope)
map("n", "<Esc>ee", function()
  require("telescope.builtin").oldfiles({
    prompt_title = "Recent Files",
    cwd_only = true, -- optional: limit to current project
    default_selection_index = 1, -- preselect the previous file (index 2 = last opened before current)
  })
end, opts)
