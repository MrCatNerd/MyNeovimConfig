return {
	"nvim-lualine/lualine.nvim",
	-- event = "UIEnter",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"meuter/lualine-so-fancy.nvim",
	},

	opts = {
		options = {
			-- theme = "seoul256",
			component_separators = { left = "|", right = "|" },
			section_separators = { left = "", right = "" },
			globalstatus = true,
			refresh = {
				statusline = 100,
			},
		},

		sections = {
			lualine_a = {
				{ "fancy_mode", width = 3 },
			},
			lualine_b = {
				{ "fancy_branch" },
				{ "fancy_diff" },
			},
			lualine_c = {
				{ "fancy_cwd", substitute_home = true },
			},
			lualine_x = {
				{ "fancy_diagnostics" },
				{ "fancy_macro" },
				{ "fancy_location" },
				{ "fancy_searchcount" },
			},
			lualine_y = {
				{ "fancy_filetype", ts_icon = "" },
			},
			lualine_z = {
				{ "fancy_lsp_servers" },
			},
		},
	},

	config = function(_, opts)
		require("lualine").setup(opts)

		-- listen lsp-progress event and refresh lualine
		vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			group = "lualine_augroup",
			pattern = "LspProgressStatusUpdated",
			callback = require("lualine").refresh,
		})
	end,
}
