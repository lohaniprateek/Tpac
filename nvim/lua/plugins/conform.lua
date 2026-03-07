return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    -- Auto-format on save for all configured filetypes.
    format_on_save = {
      timeout_ms = 1200,
      lsp_fallback = true,
    },

    formatters_by_ft = {
      -- Go formatter config starts here.
      go = { "goimports", "gofumpt" },

      -- Python formatter config starts here.
      python = { "isort", "black" },

      -- Shell formatter config starts here.
      sh = { "shfmt" },
      bash = { "shfmt" },
      zsh = { "shfmt" },

      -- YAML / Kubernetes / Ansible / pipelines formatter config starts here.
      yaml = { "yamlfmt" },
      yml = { "yamlfmt" },
      ["yaml.ansible"] = { "yamlfmt" },

      -- Docker formatter config starts here.
      dockerfile = { "prettier" },

      -- Terraform formatter config starts here.
      terraform = { "terraform_fmt" },
      tf = { "terraform_fmt" },
      hcl = { "terraform_fmt" },

      -- SQL (Postgres) formatter config starts here.
      sql = { "pg_format", "sqlfluff", stop_after_first = true },

      -- TOML formatter config starts here.
      toml = { "taplo" },

      -- C/C++ formatter config starts here.
      c = { "clang_format" },
      cpp = { "clang_format" },

      -- Lua formatter config starts here.
      lua = { "stylua" },

      -- JSON formatter config starts here.
      json = { "prettier" },
      jsonc = { "prettier" },
    },
  },
}
