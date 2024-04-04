return {
	"mfussenegger/nvim-dap",
	cmd = {
		"DapShowLog",
		"DapContinue",
		"DapToggleBreakpoint",
		"DapToggleRepl",
		"DapStepOver",
		"DapStepInto",
		"DapStepOut",
		"DapTerminate",
		"DapLoadLaunchJSON",
		"DapRestartFrame",
	},
	keys = {
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			{ desc = "Toggle DAP breakpoint" },
		},
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			{ desc = "DAP continue" },
		},
	},
	config = function()
		require("dap")
	end,
}
