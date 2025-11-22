return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    keys = {
        {
            "<leader>dt",
            function() require("dapui").toggle() end,
            { desc = "DAP UI toggle ui" },
        },
    },
    config = function(_, opts) require("dapui").setup(opts) end,
}
