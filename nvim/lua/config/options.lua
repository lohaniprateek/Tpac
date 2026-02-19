-- Always show relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--Store undos between sessions
vim.opt.undofile = true


vim.opt.mouse = "a"

-- Don't shot the mode, since it's alreday in the status-line
 vim.opt.showmode = false

 -- Case-insensitive searching Unless \C or one or more capital letters in the search term 
 vim.opt.ignorecase = true
 vim.opt.smartcase = true

 -- Keep signcolumn ( that lsp warning for errors and warnings on the RHS)
 vim.opt.signcolumn = "yes"

 -- New splits should be opened to the right and bottum
  vim.opt.splitright = true

-- Sets how nvim will display certain whitespaces characters in the editor.
-- see `:help 'list'`
-- and `:help 'listchars'`
 vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣',  }

-- Show which line your cursor is on
vim.opt.cursorline = true


vim.opt.tabstop = 2       -- how wide a tab looks
vim.opt.shiftwidth = 2    -- indent width
vim.opt.expandtab = true  -- use spaces instead of tabs
vim.opt.softtabstop = 2   -- backspace behaviour

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

vim.opt.clipboard = "unnamedplus"

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

