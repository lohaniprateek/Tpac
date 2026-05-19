vim.opt.number = true --line number
vim.opt.relativenumber = true -- relavtive line numbers`
vim.opt.cursorline=true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 5 -- keep 5 lines to above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 4 -- tab width
vim.opt.shiftwidth = 4 -- tab width
-- ** vim.opt.expandtab = false -- use spaces instead of tabs
vim.opt.softtabstop = 2 -- Spaces inserted by <Tab>
vim.opt.smartindent = true -- smart auto-indent
-- ** vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitivce search
vim.opt.smartcase = true -- case sensitive if uppercase in string
-- ** vim.opt.hlsearch =  true -- highlight search matches
-- ** vim.opt.incsearch = true -- show matches as you type 


vim.opt.signcolumn = "yes" -- always show a sign column
vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
-- ** vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
-- ** vim.opt.pumblend = 0 -- popup menu opacity
-- ** vim.opt.winblend = 0 -- floating window opacity
-- ** vim.opt.conceallevel = 0 -- do not hide markup
-- ** vim.opt.concealcursor = "" -- do not hide cursorline in markup
-- ** vim.opt.lazyredraw = false -- do not redraw during macros
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines


vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
-- ** vim.opt.autoread = true -- auto-reload changes if outside of neovim
-- ** vim.opt.autowrite = false -- do not auto-save

-- ** vim.opt.hidden = true -- allow hidden buffers
-- ** vim.opt.errorbells = false -- no error sounds
-- ** vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
-- ** vim.opt.autochdir = false -- do not autochange directories
vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
-- ** vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
-- ** vim.opt.modifiable = true -- allow buffer modifications
-- ** vim.opt.encoding = "utf-8" -- set encoding

vim.opt.guicursor =
	"n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175" -- cursor blinking and settings

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory
