return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      local ts = require("nvim-treesitter")
      local languages = {
        -- Core
        "lua",
        "vim",
        "vimdoc",
        "query",

        -- DevOps / infra
        "yaml",
        "toml",
        "json",
        "jsonc",
        "dockerfile",
        "terraform",
        "hcl",
        "bash",
        "sql",
        "groovy",

        -- Languages you asked for
        "go",
        "gomod",
        "gowork",
        "gosum",
        "python",
        "c",
        "cpp",

        -- Editing quality-of-life
        "markdown",
        "markdown_inline",
        "regex",
      }

      ts.setup({})
      ts.install(languages)

      -- Enable treesitter highlighting safely per filetype.
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitterStart", { clear = true }),
        callback = function(args)
          if vim.bo[args.buf].buftype ~= "" then
            return
          end
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
