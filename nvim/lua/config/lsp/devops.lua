return {
  lsp_servers = {
    helm_ls = {},
    yamlls = {
      settings = {
        yaml = {
          keyOrdering = false,
          validate = true,
          format = { enable = true },
          schemaStore = { enable = false, url = "" },
        },
      },
    },
    dockerls = {},
    docker_compose_language_service = {},
    ansiblels = {
      settings = {
        ansible = {
          ansible = { path = "ansible" },
          executionEnvironment = { enabled = false },
          python = { interpreterPath = "python3" },
          validation = {
            enabled = true,
            lint = { enabled = true, path = "ansible-lint" },
          },
        },
      },
    },
    jsonls = {
      settings = {
        json = { validate = { enable = true } },
      },
    },
    gh_actions_ls = {},
    azure_pipelines_ls = {},
    groovyls = {
      cmd = { "groovy-language-server" },
      filetypes = { "groovy" },
    },
    terraformls = {},
    tflint = {},
    postgres_lsp = {
      root_markers = { "postgres-language-server.jsonc", ".git" },
      workspace_required = false,
    },
    taplo = {},
  },
  lsp_ensure_installed = {
    "yamlls",
    "helm_ls",
    "dockerls",
    "docker_compose_language_service",
    "ansiblels",
    "jsonls",
    "gh_actions_ls",
    "azure_pipelines_ls",
    "groovyls",
    "terraformls",
    "tflint",
    "postgres_lsp",
    "taplo",
  },
  tool_ensure_installed = {
    "ansible-lint",
    "npm-groovy-lint",
    "yamlfmt",
    "yamllint",
    "actionlint",
    "terraform",
    "tflint",
    "pgformatter",
    "sqlfluff",
    "hadolint",
    "prettier",
    "jsonlint",
  },
}
