return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  config = function()
	  local oil = require("oil")
	  oil.setup()
	  vim.keymap.set("n","-", oil.toggle_float,{desc="Open Direcorty in Oil"})
	end,
}
