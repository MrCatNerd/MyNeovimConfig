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
    config = function()
        local dap, dapui = require "dap", require "dapui"

        -- launch dapui automatically when dapping
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- signs and fancy colors
        vim.fn.sign_define("DapBreakpoint", {
            text = "",
            texthl = "DapBreakpoint",
            linehl = "DapBreakpointLine",
            numhl = "DapBreakpoint",
        })
        vim.fn.sign_define("DapBreakpointCondition", {
            text = "",
            texthl = "DapBreakpoint",
            linehl = "DapBreakpointLine",
            numhl = "DapBreakpoint",
        })
        vim.fn.sign_define("DapBreakpointRejected", {
            text = "",
            texthl = "DapBreakpoint",
            linehl = "DapBreakpointLine",
            numhl = "DapBreakpoint",
        })
        vim.fn.sign_define("DapLogPoint", {
            text = "",
            texthl = "DapLogPoint",
            linehl = "DapLogPointLine",
            numhl = "DapLogPoint",
        })
        vim.fn.sign_define(
            "DapStopped",
            { text = "", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStopped" }
        )

        vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapBreakpointLine", {})
        vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapLogPointLine", {})
        vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
        vim.api.nvim_set_hl(0, "DapStoppedLine", {})

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

            -- On windows you may have to uncomment this:
            -- detached = false,
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {
                    function() return vim.fn.input "Args: " end,
                },
            },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end,
}
