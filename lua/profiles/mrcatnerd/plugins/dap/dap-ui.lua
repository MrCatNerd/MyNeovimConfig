return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
        {
            "<leader>dt",
            function() require("dapui").toggle_breakpoint() end,
            { desc = "DAP continue" },
        },
        {
            "<leader>dr",
            function() require("dapui").open { reset = true } end,
            { desc = "DAP continue" },
        },
    },

    config = function(_, opts)
        require("dapui").setup(opts)

        local dap, dapui = require "dap", require "dapui"

        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    end,
}
