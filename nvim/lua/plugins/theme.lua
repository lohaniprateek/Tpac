return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      local highlights = require("config.highlights")
      -- Gruvbox Material tuning (clearer contrast + readable popups).
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_statusline_style = "material"
      vim.g.gruvbox_material_ui_contrast = "high"

      vim.cmd.colorscheme("gruvbox-material")
      highlights.apply_base()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = highlights.apply_base,
      })
    end,
  },
}
