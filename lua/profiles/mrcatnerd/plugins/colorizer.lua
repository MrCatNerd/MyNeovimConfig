return {
	"norcalli/nvim-colorizer.lua",
	event = "BufReadPost",
	opts = {},
	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}
