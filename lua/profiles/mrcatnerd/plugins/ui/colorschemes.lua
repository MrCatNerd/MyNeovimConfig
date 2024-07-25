return {
	-- colorschemes
	{
		"samharju/synthweave.nvim",
	},
	-- run :colorscheme synthweave or synthweave-transparent when feeling like it
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)

			-- setup must be called before loading
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {
			disable_background = true,
			variant = "moon", -- auto, main, moon, or dawn
			dark_variant = "moon", -- main, moon, or dawn
			dim_inactive_windows = true,
			extend_background_behind_borders = true,

			enable = {
				terminal = false,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			highlight_groups = {
				-- Transperent telescope.nvim
				TelescopeBorder = { fg = "highlight_high", bg = "none" },
				TelescopeNormal = { bg = "none" },
				TelescopePromptNormal = { bg = "base" },
				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
				TelescopeSelection = { fg = "text", bg = "base" },
				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
		priority = 1000,
	},
	{

		"maxmx03/fluoromachine.nvim",
		priority = 1000,
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = true,
				theme = "delta", -- you can choose: fluoromachine, retrowave, delta
			})
		end,
	},
	{ "sainnhe/gruvbox-material", priority = 1000, config = true, opts = ... },
}
