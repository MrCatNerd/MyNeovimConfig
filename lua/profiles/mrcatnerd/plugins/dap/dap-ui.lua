return {
	"rcarriga/nvim-dap-ui",
	dependencies = "mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dt",
			function()
				require("dapui").toggle()
			end,
			{ desc = "DAP continue" },
		},
		{
			"<leader>dr",
			function()
				require("dapui").open({ reset = true })
			end,
			{ desc = "DAP continue" },
		},
	},

	config = function()
		require("dapui").setup()
	end,
}
