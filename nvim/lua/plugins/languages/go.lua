return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		-- Keep Go plugin features, but let lua/plugins/lsp.lua own LSP setup.
		lsp_cfg = false,
		lsp_keymaps = false,
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	config = function(_, opts)
		require("go").setup(opts)
	end,
	build = ':lua require("go.install").update_all_sync()',
}
