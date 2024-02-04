return {
	-- "folke/drop.nvim",
	dir = vim.fn.expand("$HOME/Documents/nvim_plugins/drop.nvim/"),
	event = "UIEnter",
	config = function()
		require("drop").setup()
	end,
}
