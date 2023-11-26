return { -- to look into: https://github.com/NvChad/nvterm
	"akinsho/toggleterm.nvim",
	version = "*",
	keys = {
		{
			"<leader>tt",
			-- "<cmd>ToggleTerm size=13 direction=horizontal name=Terminal<CR>",
			"<cmd>ToggleTerm direction=horizontal name=Terminal<CR>",
			desc = "Open new terminal (terminal.nvim)",
		},
	},
	cmd = {
		"ToggleTerm",
		"ToggleTermToggleAll",
		"TermExec",
		"TermSelect",
		"ToggleTermSetName",
	},
	opts = { --[[ things you want to change go here]]
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
