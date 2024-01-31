return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	cmd = { "Refactor" },
	keys = {
		{
			"<leader>ri",
			[[<Cmd>'<,'>lua require('refactoring').refactor('Inline Variable')<CR>]],
			{ noremap = true, silent = true, expr = false },
			mode = "v",
		},
	},
	config = function()
		require("refactoring").setup()
	end,
	enabled = function() -- treesitter is not working on windows :(
		return not (vim.loop.os_uname().sysname == "Windows_NT")
	end,
}
