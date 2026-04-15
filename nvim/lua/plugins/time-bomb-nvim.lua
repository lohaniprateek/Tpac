return {
	"Lachignol/time-bomb.nvim",
	config = function()
		require("time-bomb").setup({
			enable_default_keymaps = true,

			-- If you want overload with custom keymaps don't set enable_default_keymaps at false.
			keymaps = {
				timer_custom = "<leader>tbc", -- Custom timer
				pomodoro_start = "<leader>tbs", -- Start Pomodoro
				stop_timer = "<leader>tbe", -- Stop timer
				pause_timer = "<leader>tbp", -- Pause/Resume
				next_timer = "<leader>tbn", -- Next cycle
				prev_timer = "<leader>tbb", -- Previous cycle
			},

			pomodoro_cycles = {
				{ title = "Work", time = "25", style = "mama-lova" }, -- Time in minute*
				{ title = "Short-Break", time = "5", style = "cyberpunk" },
				{ title = "Work", time = "25", style = "fire" },
				{ title = "Short-Break", time = "5", style = "dots" },
				{ title = "Work", time = "25", style = "music" },
				{ title = "Long-Break", time = "15", style = "normal" },
			},
			-- *Time must be upper than 1 min and less than 1440 min (1 day)
			timer_color = "lime", -- lime, blue, black, gray, silver, white, fuchsia
			enable_notification = true, -- System notifications
		})
	end,
}
