return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"sainnhe/gruvbox-material",
	},
	config = function()
		local function noice_command()
			local ok, noice = pcall(require, "noice")
			if not ok then
				return ""
			end
			return noice.api.status.command.get()
		end

		local function noice_command_has()
			local ok, noice = pcall(require, "noice")
			if not ok then
				return false
			end
			return noice.api.status.command.has()
		end

		local function macro_recording()
			local reg = vim.fn.reg_recording()
			if reg ~= nil and reg ~= "" then
				return "REC @" .. reg
			end
			reg = vim.fn.reg_executing()
			if reg ~= nil and reg ~= "" then
				return "RUN @" .. reg
			end
			return ""
		end

		require("lualine").setup({
			options = {
				theme = "gruvbox-material",
				refresh = {
					statusline = 100,
					tabline = 250,
					winbar = 250,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = {
					{
						noice_command,
						cond = noice_command_has,
						color = { fg = "#fe8019", gui = "bold" },
					},
					{
						macro_recording,
						cond = function()
							return macro_recording() ~= ""
						end,
						color = { fg = "#fabd2f", gui = "bold" },
					},
					"encoding",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
