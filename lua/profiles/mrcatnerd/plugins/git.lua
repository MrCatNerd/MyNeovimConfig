--[[ return {
		"tpope/vim-fugitive",
		cmd = {
			"Git",
			"Gedit",
			"Gsplit",
			"Gdiffsplit",
			"Gvdiffsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"Glgrep",
			"GMove",
			"GDelete",
			"GBrowse",
		},
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Toggles Git" },
		},
	} ]]

return {
	"NeogitOrg/neogit",
	cmd = { "Neogit", "NeogitResetState" },
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		-- "sindrets/diffview.nvim", -- optional - Diff integration

		"nvim-telescope/telescope.nvim", -- optional
	},
	keys = {
		{
			"<leader>gc",
			function()
				require("neogit").open()
			end,
			desc = "Toggles Git",
		},
	},
	opts = {},
	config = true,
}
