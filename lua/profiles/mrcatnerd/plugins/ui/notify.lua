return {
	{
		"rcarriga/nvim-notify",
		-- event = "UIEnter",
		-- event = "VeryLazy",
		init = function()
			require("common.utils").lazy_load("nvim-notify")
		end,

		config = function()
			local notify = require("notify")
			notify.setup({
				background_colour = "#000000",
				render = "compact",
				stages = "fade_in_slide_out",
				top_down = true,
				icons = {
					DEBUG = "",
					ERROR = "",
					INFO = "",
					TRACE = "✎",
					WARN = "",
				},
			})

			vim.notify = notify

			notify("Shut down your computer to exit Vim", "warning") -- best line of code ever
		end,
	},
	{
		"mrded/nvim-lsp-notify",
		dependencies = { "rcarriga/nvim-notify" },
		init = function()
			require("common.utils").lazy_load("nvim-lsp-notify")
		end,
		config = function()
			require("lsp-notify").setup()
		end,
	},
}
