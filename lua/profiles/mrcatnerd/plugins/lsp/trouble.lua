return {
    "folke/trouble.nvim",
    cmd = {
        "Trouble",
        "TroubleClose",
        "TroubleToggle",
        "TroubleRefresh",
    },
    keys = {
        {
            "<leader>ft",
            "<cmd>Trouble diagnostics toggle<CR>",
            desc = "Toggles trouble worksapce diagnostics",
        },
        { "<leader>fq", "<cmd>Trouble quickfix toggle<CR>", desc = "Toggles trouble quickfix list" },
        { "gR", "<cmd>Trouble lsp_references toggle<CR>", desc = "Toggles trouble lsp references" },
    },
    opts = {
        modes = {
            test = {
                mode = "diagnostics",
                preview = {
                    type = "split",
                    relative = "win",
                    position = "right",
                    size = 0.3,
                },
            },
        },
    },
}
