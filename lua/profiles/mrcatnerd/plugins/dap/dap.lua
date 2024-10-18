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
            function() require("dap").toggle_breakpoint() end,
            { desc = "Toggle DAP breakpoint" },
        },
        {
            "<F1>",
            function() require("dap").continue() end,
            { desc = "Start or continue the DAP" },
        },
        {
            "<F2>",
            function() require("dap").step_into() end,
            { desc = "DAP step into" },
        },
        {
            "<F3>",
            function() require("dap").step_over() end,
            { desc = "DAP step over" },
        },
        {
            "<F4>",
            function() require("dap").step_out() end,
            { desc = "DAP step out" },
        },
        {
            "<F12>",
            function() require("dap").restart() end,
            { desc = "Restart the program in DAP" },
        },
    },
    config = function() require "dap" end,
}
