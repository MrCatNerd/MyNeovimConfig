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
	config = function(_, opts)
		require("neogit").setup(opts)

		local group = vim.api.nvim_create_augroup("MyCustomNeogitEvents", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "NeogitPushComplete",
			group = group,
			callback = function()
				require("notify").notify("Your code is now destoryed!", "info")
			end,
		})
	end,
}
