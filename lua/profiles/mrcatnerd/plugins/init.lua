local plugins = { -- lazy is true by default (lua\\profiles\\mrcatnerd\\opts.lua)
	-- must have plugins:
	"nvim-lua/plenary.nvim",

	{
		"nvim-tree/nvim-web-devicons",
		cmd = "NvimWebDeviconsHiTest",
		config = function(_, opts)
			require("nvim-web-devicons").setup(opts)
		end,
	}, -- needs nerdfont

	require("profiles.mrcatnerd.plugins.ui"),

	require("profiles.mrcatnerd.plugins.harpoon"),
	require("profiles.mrcatnerd.plugins.telescope"),

	require("profiles.mrcatnerd.plugins.treesitter"),
	require("profiles.mrcatnerd.plugins.refactoring"),
	require("profiles.mrcatnerd.plugins.neogen"),

	require("profiles.mrcatnerd.plugins.others"),

	require("profiles.mrcatnerd.plugins.lsp"),
	require("profiles.mrcatnerd.plugins.dap"),

	require("profiles.mrcatnerd.plugins.surround"),
	require("profiles.mrcatnerd.plugins.todocomments"),
	require("profiles.mrcatnerd.plugins.git"),
	require("profiles.mrcatnerd.plugins.terminal"),
	require("profiles.mrcatnerd.plugins.colorizer"),
	require("profiles.mrcatnerd.plugins.sql"),
	require("profiles.mrcatnerd.plugins.xtras"),

	require("profiles.mrcatnerd.plugins.java"),
}

local opts = require("profiles.mrcatnerd.core.opts")

require("lazy").setup(plugins, opts)
