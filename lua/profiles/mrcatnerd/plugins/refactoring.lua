return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	keys = {
		{
			"<leader>ri",
			[[ <Esc><Cmd>lua require('refaitoring').refactor('Inline Variable')<CR>]],
			{ noremap = true, silent = true, expr = false },
		},
	},
	config = function()
		require("refactoring").setup()
	end,
	enabled = function() -- treesitter is not working on windows :(
		return not (vim.loop.os_uname().sysname == "Windows_NT")
	end,
}
