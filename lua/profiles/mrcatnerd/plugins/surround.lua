return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	keys = {
		{ "cs", desc = "Change surrounding" },
		{ "ds", desc = "Delete surrounding" },
		{ "ys", desc = "Add surrounding" },
	},
	config = function()
		require("nvim-surround").setup({
			-- Configuration options here
		})
	end,
}
