return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 300,
      win = {
        border = "rounded",
      },
      spec = {
        { "<leader>f", group = "Find" },
        { "<leader>l", group = "LSP / Lint" },
        { "<leader>x", group = "Diagnostics" },
        { "<leader>w", group = "Window" },
        { "<leader>b", group = "Buffer" },
        { "<leader>s", group = "Split" },
        { "<leader>c", group = "Code / Search" },
        { "<leader>p", group = "Path / Paste" },
        { "<leader>t", desc = "Terminal" },
        { "<leader>e", desc = "Explorer" },
      },
    },
  },
}
