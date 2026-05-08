require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "gopls", "clangd", "marksman" },
})

vim.lsp.config("lua_ls", {})
vim.lsp.config("gopls", {})
vim.lsp.config("clangd", {})
vim.lsp.config("marksman", {})

vim.lsp.enable({ "lua_ls", "gopls", "clangd", "marksman" })
