return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile", "BufWritePost" },
    config = function()
      local lint = require("lint")

      local function set_linters(ft, candidates)
        local selected = {}
        for _, name in ipairs(candidates) do
          if lint.linters[name] then
            table.insert(selected, name)
          end
        end
        if #selected > 0 then
          lint.linters_by_ft[ft] = selected
        end
      end

      local function cmd_is_available(cmd)
        if type(cmd) == "function" then
          local ok, resolved = pcall(cmd)
          cmd = ok and resolved or nil
        end
        return type(cmd) == "string" and vim.fn.executable(cmd) == 1
      end

      local function run_available_linters(ft)
        local names = lint._resolve_linter_by_ft(ft)
        if not names or #names == 0 then
          return
        end

        local available = {}
        for _, name in ipairs(names) do
          local linter = lint.linters[name]
          if type(linter) == "function" then
            local ok, resolved = pcall(linter)
            linter = ok and resolved or nil
          end
          if linter and cmd_is_available(linter.cmd) then
            table.insert(available, name)
          end
        end

        if #available > 0 then
          lint.try_lint(available)
        end
      end

      -- Python linter config starts here.
      set_linters("python", { "pylint", "ruff" })

      -- Shell linter config starts here.
      set_linters("sh", { "shellcheck" })
      set_linters("bash", { "shellcheck" })
      set_linters("zsh", { "shellcheck" })

      -- YAML / Kubernetes / Ansible / pipelines linter config starts here.
      set_linters("yaml", { "yamllint" })
      set_linters("yml", { "yamllint" })
      set_linters("yaml.ansible", { "ansible_lint", "yamllint" })

      -- Docker linter config starts here.
      set_linters("dockerfile", { "hadolint" })

      -- Terraform linter config starts here.
      set_linters("terraform", { "tflint" })
      set_linters("tf", { "tflint" })

      -- SQL linter config starts here.
      set_linters("sql", { "sqlfluff" })

      -- Jenkins/Groovy linter config starts here.
      set_linters("groovy", { "npm_groovy_lint" })

      -- JSON linter config starts here.
      set_linters("json", { "jsonlint" })
      set_linters("jsonc", { "jsonlint" })

      -- Disable nvim-lint defaults that require vale unless explicitly configured.
      lint.linters_by_ft.markdown = {}
      lint.linters_by_ft.text = {}
      lint.linters_by_ft.rst = {}

      local group = vim.api.nvim_create_augroup("NvimLint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = group,
        callback = function()
          local ft = vim.bo.filetype
          local file = vim.api.nvim_buf_get_name(0)

          -- GitHub Actions workflow linting.
          if file:find("/%.github/workflows/") and lint.linters.actionlint then
            run_available_linters("yaml")
            run_available_linters("gh_actions")
            return
          end

          run_available_linters(ft)
        end,
      })

      vim.keymap.set("n", "<leader>ll", function()
        run_available_linters(vim.bo.filetype)
      end, { desc = "Run linters for current file" })
    end,
  },
}
