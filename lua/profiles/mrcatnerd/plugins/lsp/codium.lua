return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "InsertEnter",
	cmd = "Codeium",
	config = function()
		require("codeium").setup({})
	end,
}
