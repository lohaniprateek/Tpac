local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Exit insert mode with jj
map({"i","v","c"}, "jj", "<Esc>", opts)

-- (Optional) Exit terminal mode with jj
map("t", "jj", [[<C-\><C-n>]], opts)

map("n","<leader>x", ".lua.<CR>")
