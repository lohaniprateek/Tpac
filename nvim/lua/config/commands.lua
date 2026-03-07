local function get_conform_formatters_for_ft(ft)
  local ok, conform = pcall(require, "conform")
  if not ok then
    return {}
  end

  local formatters = conform.list_formatters_for_buffer(0)
  if type(formatters) == "table" then
    return formatters
  end

  return {}
end

local function get_lint_linters_for_ft(ft)
  local ok, lint = pcall(require, "lint")
  if not ok then
    return {}
  end

  local names = lint.linters_by_ft[ft] or {}
  if type(names) ~= "table" then
    return {}
  end

  return names
end

vim.api.nvim_create_user_command("DevOpsHealth", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local active_clients = vim.lsp.get_clients({ bufnr = bufnr })
  local lsp_names = {}
  for _, client in ipairs(active_clients) do
    table.insert(lsp_names, client.name)
  end

  local formatters = get_conform_formatters_for_ft(ft)
  local linters = get_lint_linters_for_ft(ft)

  local lines = {
    "DevOpsHealth:",
    "  filetype: " .. (ft ~= "" and ft or "(none)"),
    "  lsp: " .. (#lsp_names > 0 and table.concat(lsp_names, ", ") or "none"),
    "  formatters(conform): " .. (#formatters > 0 and table.concat(formatters, ", ") or "none"),
    "  linters(nvim-lint): " .. (#linters > 0 and table.concat(linters, ", ") or "none"),
  }

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "Neovim DevOps Health" })
end, { desc = "Show active LSP, formatter and linter for current buffer" })
