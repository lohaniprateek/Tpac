vim.pack.add({
  'https://github.com/williamboman/mason.nvim',
  'https://github.com/williamboman/mason-lspconfig.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/hrsh7th/nvim-cmp',
  'https://github.com/hrsh7th/cmp-nvim-lsp',
  'https://github.com/saadparwaiz1/cmp_luasnip',
  'https://github.com/L3MON4D3/LuaSnip',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/nvim-tree/nvim-tree.lua',
  'https://github.com/nvim-tree/nvim-web-devicons', -- if you prefer nvim-web-devicons
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
  {
    src = 'https://github.com/obsidian-nvim/obsidian.nvim',
    version = vim.version.range "*",
  },
})

local function safe_require(mod)
  local ok, err = pcall(require, mod)
  if not ok then
    vim.notify("Config not found: " .. mod .. "\n" .. err, vim.log.levels.WARN)
  end
end

safe_require("gamebred.plugins.lspconfig")
safe_require("gamebred.plugins.cmp")
safe_require("gamebred.plugins.nvim-treesitter")
safe_require("gamebred.plugins.gitsigns")
safe_require("gamebred.plugins.which-key")
safe_require("gamebred.plugins.nvim-tree")
safe_require("gamebred.plugins.lualine")
safe_require("gamebred.plugins.obsidian")
