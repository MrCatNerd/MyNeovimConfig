return {
    "theHamsta/nvim-dap-virtual-text",
    { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
    cmd = {
        "DapVirtualTextEnable",
        "DapVirtualTextDisable",
        "DapVirtualTextToggle",
        "DapVirtualTextForceRefresh",
    },
    opts = {
        commented = true,
        show_stop_reason = true,
    },
}
