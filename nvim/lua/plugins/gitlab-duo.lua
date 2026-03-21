return {
	"https://gitlab.com/gitlab-org/editor-extensions/gitlab.vim.git",
	-- Activate when a file is created/opened
	event = { "BufReadPre", "BufNewFile" },
	-- Activate when a supported filetype is open
	ft = { "go", "javascript", "python", "ruby", "yaml" },
	cond = function()
		-- Only activate if token is present in environment variable.
		-- Remove this line to use the interactive workflow.
		return vim.env.GITLAB_TOKEN ~= nil and vim.env.GITLAB_TOKEN ~= ""
	end,

	config = function()
		require("gitlab").setup({
			statusline = {
				enabled = true,
			},
			resource_editing = {
				enabled = false,
			},
			minimal_message_level = vim.lsp.log_levels.INFO,
			code_suggestions = {
				auto_filetypes = {
					"c", -- C
					"cpp", -- C++
					"csharp", -- C#
					"go", -- Golang
					"javascript", -- JavaScript
					"markdown", -- Markdown
					"objective-c", -- Objective-C
					"objective-cpp", -- Objective-C++
					"php", -- PHP
					"python", -- Python
					"ruby", -- Ruby
					"scala", -- Scala
					"sql", -- SQL
					"terraform", -- Terraform
					"sh", -- Shell scripts
					"html", -- HTML
					"css", -- CSS
				},
				enabled = true,
				fix_newlines = true,
				lsp_binary_path = "node",
				offset_encoding = "utf-16",
				redact_secrets = true,
			},
			language_server = {
				workspace_settings = {
					codeCompletion = {
						enableSecretRedaction = true,
					},
					telemetry = {
						enabled = true,
						trackingUrl = nil,
					},
				},
			},
		})
	end,
}
