local map = vim.keymap.set

map({"i", "v", "t" },  "jj", "<Esc>", { desc = "Back to Normal mode from any mode"})
map("c" , "jj", "<Esc>", { desc = "Back to Normal mode from Terminal mode"})

map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
map({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

map("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })

map("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })

map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
map("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree", silent = true })
map("n", "<leader>ef", ":NvimTreeFocus<CR>",  { desc = "Focus file tree",  silent = true })

-- In terminal Neovim, Ctrl+Shift+j/k is usually sent as Ctrl+j/k.
map("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down (Ctrl+Shift compatible)" })
map("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up (Ctrl+Shift compatible)" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down (Ctrl+Shift compatible)" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up (Ctrl+Shift compatible)" })

map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

map("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })
