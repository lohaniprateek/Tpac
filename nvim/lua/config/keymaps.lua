local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map({ "i", "v", "t" }, "jj", "<Esc>", opts)
map("c", "jj", "<C-c>", opts)
