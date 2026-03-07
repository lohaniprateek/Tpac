return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        "                                                   ",
        " ███████████ █████                    █████████                                     █████                            █████ ",
        "░█░░░███░░░█░░███                    ███░░░░░███                                   ░░███                            ░░███  ",
        "░   ░███  ░  ░███████    ██████     ███     ░░░   ██████   █████████████    ██████  ░███████  ████████   ██████   ███████  ",
        "    ░███     ░███░░███  ███░░███   ░███          ░░░░░███ ░░███░░███░░███  ███░░███ ░███░░███░░███░░███ ███░░███ ███░░███  ",
        "    ░███     ░███ ░███ ░███████    ░███    █████  ███████  ░███ ░███ ░███ ░███████  ░███ ░███ ░███ ░░░ ░███████ ░███ ░███   ",
        "    ░███     ░███ ░███ ░███░░░     ░░███  ░░███  ███░░███  ░███ ░███ ░███ ░███░░░   ░███ ░███ ░███     ░███░░░  ░███ ░███   ",
        "    █████    ████ █████░░██████     ░░█████████ ░░████████ █████░███ █████░░██████  ████████  █████    ░░██████ ░░████████  ",
        "   ░░░░░    ░░░░ ░░░░░  ░░░░░░       ░░░░░░░░░   ░░░░░░░░ ░░░░░ ░░░ ░░░░░  ░░░░░░  ░░░░░░░░  ░░░░░      ░░░░░░   ░░░░░░░░ ",
      }

      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file", "<cmd>Telescope find_files<cr>"),
        dashboard.button("n", "  New file", "<cmd>ene<bar>startinsert<cr>"),
        dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
        dashboard.button("g", "  Find text", "<cmd>Telescope live_grep<cr>"),
        dashboard.button("c", "  Config", "<cmd>edit $MYVIMRC<cr>"),
        dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<cr>"),
        dashboard.button("q", "  Quit", "<cmd>qa<cr>"),
      }

      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end

      -- Base dashboard colors. Header gradient is applied in config below.
      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#fabd2f", ctermfg = 214, bold = true })
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#ebdbb2", ctermfg = 223, bold = true })
      vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fe8019", ctermfg = 208, bold = true })
      vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a89984", ctermfg = 246 })

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.section.footer.opts.hl = "AlphaFooter"

      dashboard.opts.layout[1].val = 3

      return dashboard.opts
    end,
    config = function(_, opts)
      require("alpha").setup(opts)

      local uv = vim.uv or vim.loop
      local alpha_ns = vim.api.nvim_create_namespace("AlphaArchGradient")
      local arch_groups = {
        "AlphaGruvDark",
        "AlphaGruvRed",
        "AlphaGruvOrange",
        "AlphaGruvYellow",
        "AlphaGruvGold",
        "AlphaGruvOrange",
        "AlphaGruvYellow",
        "AlphaGruvDark",
      }

      local palettes = {
        { dark = "#3c3836", red = "#cc241d", orange = "#d65d0e", yellow = "#d79921", gold = "#fabd2f" },
        { dark = "#504945", red = "#fb4934", orange = "#fe8019", yellow = "#fabd2f", gold = "#fabd2f" },
        { dark = "#282828", red = "#9d0006", orange = "#af3a03", yellow = "#b57614", gold = "#d8a657" },
      }

      local current_alpha_buf = nil
      local flicker_timer = nil
      local flicker_tick = 0

      local function set_arch_hls(palette_idx)
        local p = palettes[palette_idx] or palettes[1]
        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = p.gold, ctermfg = 214, bold = true })
        vim.api.nvim_set_hl(0, "AlphaGruvDark", { fg = p.dark, ctermfg = 237, bold = true })
        vim.api.nvim_set_hl(0, "AlphaGruvRed", { fg = p.red, ctermfg = 167, bold = true })
        vim.api.nvim_set_hl(0, "AlphaGruvOrange", { fg = p.orange, ctermfg = 208, bold = true })
        vim.api.nvim_set_hl(0, "AlphaGruvYellow", { fg = p.yellow, ctermfg = 214, bold = true })
        vim.api.nvim_set_hl(0, "AlphaGruvGold", { fg = p.gold, ctermfg = 220, bold = true })
        vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#ebdbb2", ctermfg = 223, bold = true })
        vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fe8019", ctermfg = 208, bold = true })
        vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a89984", ctermfg = 246 })
      end

      local function apply_arch_gradient(bufnr, shift)
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end
        if vim.bo[bufnr].filetype ~= "alpha" then
          return
        end

        vim.api.nvim_buf_clear_namespace(bufnr, alpha_ns, 0, -1)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        local i = 1
        local step = shift or 0
        for lnum, line in ipairs(lines) do
          if line:find("█") or line:find("░") then
            local idx = ((i - 1 + step) % #arch_groups) + 1
            local hl = arch_groups[idx]
            vim.api.nvim_buf_add_highlight(bufnr, alpha_ns, hl, lnum - 1, 0, -1)
            i = i + 1
          end
        end
      end

      local function stop_flicker()
        if flicker_timer then
          flicker_timer:stop()
          flicker_timer:close()
          flicker_timer = nil
        end
      end

      local function start_flicker(bufnr)
        if not uv then
          set_arch_hls(1)
          apply_arch_gradient(bufnr, 0)
          return
        end

        stop_flicker()
        current_alpha_buf = bufnr
        flicker_tick = 0
        set_arch_hls(1)
        apply_arch_gradient(bufnr, 0)

        flicker_timer = uv.new_timer()
        if not flicker_timer then
          return
        end

        flicker_timer:start(180, 180, vim.schedule_wrap(function()
          if not current_alpha_buf or not vim.api.nvim_buf_is_valid(current_alpha_buf) then
            stop_flicker()
            return
          end
          if vim.bo[current_alpha_buf].filetype ~= "alpha" then
            stop_flicker()
            return
          end

          flicker_tick = flicker_tick + 1
          local palette_idx = (flicker_tick % #palettes) + 1
          local shift = (flicker_tick % 4 == 0) and 1 or 0
          set_arch_hls(palette_idx)
          apply_arch_gradient(current_alpha_buf, shift)
        end))
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          set_arch_hls(1)
          if current_alpha_buf and vim.api.nvim_buf_is_valid(current_alpha_buf) then
            apply_arch_gradient(current_alpha_buf, 0)
          end
        end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "alpha",
        callback = function(args)
          start_flicker(args.buf)
        end,
      })

      vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout", "VimLeavePre" }, {
        callback = function(args)
          if args.event == "VimLeavePre" or (current_alpha_buf and args.buf == current_alpha_buf) then
            stop_flicker()
            if args.buf == current_alpha_buf then
              current_alpha_buf = nil
            end
          end
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyDone",
        callback = function()
          local ok, alpha = pcall(require, "alpha")
          if not ok then
            return
          end

          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          local footer = "⚡ Neovim loaded "
            .. stats.loaded
            .. "/"
            .. stats.count
            .. " plugins in "
            .. ms
            .. "ms"

          local dashboard = require("alpha.themes.dashboard")
          dashboard.section.footer.val = footer
          pcall(alpha.redraw)
        end,
      })
    end,
  },
}
