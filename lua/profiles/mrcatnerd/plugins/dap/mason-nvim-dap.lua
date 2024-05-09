return {
	"jay-babu/mason-nvim-dap.nvim",
	dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	cmd = { "DapInstall", "DapUninstall" },
	opts = {
		handlers = {},
	},
	config = function(_, opts)
		require("mason-nvim-dap").setup(opts)
	end,
}
