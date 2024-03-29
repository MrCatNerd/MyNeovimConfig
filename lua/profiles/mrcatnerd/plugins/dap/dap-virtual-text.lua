return {
	"theHamsta/nvim-dap-virtual-text",
	cmd = {
		"DapVirtualTextEnable",
		"DapVirtualTextDisable",
		"DapVirtualTextToggle",
		"DapVirtualTextForceRefresh",
	},
	config = function()
		require("nvim-dap-virtual-text").setup()
	end,
}
