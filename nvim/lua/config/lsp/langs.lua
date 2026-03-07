return {
  lsp_servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
          workspace = { checkThirdParty = false },
        },
      },
    },
    gopls = {
      settings = {
        gopls = {
          analyses = { shadow = true, unusedparams = true },
          completeUnimported = true,
          gofumpt = true,
          staticcheck = true,
          usePlaceholders = true,
        },
      },
    },
    pyright = {},
    bashls = {},
    clangd = {},
  },
  lsp_ensure_installed = { "lua_ls", "gopls", "pyright", "bashls", "clangd" },
  tool_ensure_installed = {
    "stylua",
    "goimports",
    "gofumpt",
    "black",
    "isort",
    "pylint",
    "shfmt",
    "shellcheck",
    "clang-format",
    "eslint_d",
  },
}
