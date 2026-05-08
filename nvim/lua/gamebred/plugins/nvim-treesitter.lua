require("nvim-treesitter").setup({
  ensure_installed = { "lua", "vim", "vimdoc", "markdown", "markdown_inline", "go", "c" },
  auto_install = true,
  highlight = { enable = true },
})
