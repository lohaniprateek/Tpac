local devops = require("config.lsp.devops")
local langs = require("config.lsp.langs")

local function merge_lists(a, b)
  local out, seen = {}, {}
  for _, v in ipairs(a) do
    if not seen[v] then
      seen[v] = true
      table.insert(out, v)
    end
  end
  for _, v in ipairs(b) do
    if not seen[v] then
      seen[v] = true
      table.insert(out, v)
    end
  end
  return out
end

local function merge_tables(a, b)
  return vim.tbl_deep_extend("force", a or {}, b or {})
end

local ensure_lsp = merge_lists(langs.lsp_ensure_installed, devops.lsp_ensure_installed)
local ensure_tools = merge_lists(langs.tool_ensure_installed, devops.tool_ensure_installed)

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = ensure_lsp,
      automatic_enable = false,
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = ensure_tools,
    },
  },
  { "b0o/schemastore.nvim", lazy = true },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp", "b0o/schemastore.nvim" },
    config = function()
      vim.filetype.add({
        filename = { Jenkinsfile = "groovy" },
        pattern = { ["Jenkinsfile%..*"] = "groovy" },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      vim.diagnostic.config({
        virtual_text = { spacing = 2, source = "if_many" },
        float = { border = "rounded", source = "if_many" },
        severity_sort = true,
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "LSP: Goto Definition")
        map("n", "gD", vim.lsp.buf.declaration, "LSP: Goto Declaration")
        map("n", "gr", vim.lsp.buf.references, "LSP: References")
        map("n", "gi", vim.lsp.buf.implementation, "LSP: Implementations")
        map("n", "K", vim.lsp.buf.hover, "LSP: Hover")
        map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "LSP: Code Action")
        map("n", "<leader>cA", function()
          vim.lsp.buf.code_action({ apply = true })
        end, "LSP: Code Action (Apply First)")
        map("n", "<leader>fd", vim.diagnostic.open_float, "Diagnostics: Line")
        map("n", "[d", vim.diagnostic.goto_prev, "Diagnostics: Prev")
        map("n", "]d", vim.diagnostic.goto_next, "Diagnostics: Next")
        map("n", "<leader>li", "<cmd>LspInfo<cr>", "LSP: Info")

        if client.supports_method("textDocument/inlayHint") then
          vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

          map("n", "<leader>uh", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = bufnr })
          end, "LSP: Toggle Inlay Hints")
        end
      end

      local has_schema, schemastore = pcall(require, "schemastore")
      local yaml_schemas, json_schemas = {}, {}
      if has_schema then
        yaml_schemas = schemastore.yaml.schemas()
        json_schemas = schemastore.json.schemas()
      end

      local extra_yaml_schemas = {
        {
          description = "Helm chart values",
          fileMatch = { "values.yaml", "values-*.yaml" },
          name = "Helm Chart Values",
          url = "https://json.schemastore.org/chart",
        },
        {
          description = "Kubernetes manifests",
          fileMatch = { "k8s*.yaml", "kubernetes*.yaml" },
          name = "Kubernetes",
          url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json",
        },
      }
      if vim.islist(yaml_schemas) then
        vim.list_extend(yaml_schemas, extra_yaml_schemas)
      elseif type(yaml_schemas) == "table" then
        yaml_schemas = vim.tbl_deep_extend("force", yaml_schemas, {
          ["https://json.schemastore.org/chart"] = "Chart.yaml",
          ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict/all.json"] = {
            "k8s*.yaml",
            "kubernetes*.yaml",
          },
        })
      end

      local servers = merge_tables(langs.lsp_servers, devops.lsp_servers)
      if servers.yamlls and servers.yamlls.settings then
        servers.yamlls.settings.yaml.schemas = yaml_schemas
      end
      if servers.jsonls and servers.jsonls.settings then
        servers.jsonls.settings.json.schemas = json_schemas
      end

      for server, server_opts in pairs(servers) do
        local merged = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          on_attach = on_attach,
        }, server_opts or {})

        local ok_config = pcall(vim.lsp.config, server, merged)
        if ok_config then
          pcall(vim.lsp.enable, server)
        else
          vim.schedule(function()
            vim.notify(("[LSP] Config '%s' not found in nvim-lspconfig"):format(server), vim.log.levels.WARN)
          end)
        end
      end
    end,
  },
}
