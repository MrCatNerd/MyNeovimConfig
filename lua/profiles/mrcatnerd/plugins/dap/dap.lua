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
			"<leader>dr",
			function()
				require("dap").continue()
			end,
			{ desc = "Start or continue the DAP" },
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			{ desc = "DAP step over" },
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			{ desc = "DAP step into" },
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			{ desc = "DAP step out" },
		},
	},
	config = function()
		require("dap")
	end,
}
