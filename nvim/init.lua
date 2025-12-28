-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.autoread = true
vim.cmd([[
  autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    if mode() != 'c' | checktime | endif
]])
