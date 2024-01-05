return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	keys = {
		{ "ds", mode = { "n", "o" }, desc = "WIP" },
		{ "ds", mode = "x", desc = "WIP" },
		{ "cs", mode = { "n", "o" }, desc = "WIP" },
		{ "cs", mode = "x", desc = "WIP" },
		{ "ys", mode = { "n", "o" }, desc = "WIP" },
		{ "ys", mode = "x", desc = "WIP" },
	},
	config = function()
		require("nvim-surround").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}
