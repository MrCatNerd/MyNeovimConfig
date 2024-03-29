return { -- only activated on windows cuz no tmux on windows
	"akinsho/toggleterm.nvim",
	version = "*",
	enabled = vim.fn.has("win32") ~= 0, -- tmux btw
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
	opts = {},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
