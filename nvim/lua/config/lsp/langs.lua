return {
  lsp_servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion = { callSnippet = "Replace" },
          workspace = { checkThirdParty = false },
          hint = {
            enable = true,
            arrayIndex = "Enable",
            await = true,
            paramName = "All",
            paramType = true,
            semicolon = "Disable",
            setType = true,
          },
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
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    },
    pyright = {
      settings = {
        python = {
          analysis = {
            inlayHints = {
              variableTypes = true,
              functionReturnTypes = true,
              callArgumentNames = true,
              pytestParameters = true,
            },
          },
        },
      },
    },
    bashls = {},
    clangd = {
      cmd = { "clangd", "--inlay-hints" },
    },
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
