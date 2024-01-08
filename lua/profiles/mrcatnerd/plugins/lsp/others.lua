return {
	{
		"saecki/crates.nvim",
		event = "BufReadPost Cargo.toml",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("crates").setup({
				src = {
					cmp = {
						enabled = true,
					},
				},
			})
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("fidget").setup()
		end,
	},
}
