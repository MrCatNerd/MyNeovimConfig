return {
    -- best plugin ever
    {
        "tjdevries/sPoNGe-BoB.NvIm",
        cmd = {
            "SpOnGeBoBtOgGlE",
            "SpOnGeBoBeNaBlE",
            "SpOnGeBoBdIsAbLe",
            "SpOnGeBoBiFy",
        },
    },
    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n", desc = "Comment toggle current line" },
            { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n", desc = "Comment toggle current block" },
            { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
        },
        config = function() require("Comment").setup() end,
    },

    -- other
    {
        "mbbill/undotree",
        cmd = {
            "UndotreeToggle",
            "UndotreeShow",
            "UndotreeHide",
            "UndotreeFocus",
            "UndotreePersistUndo",
        },
        keys = {
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggles undotree" },
        },
    },

    -- stupid stuff / maliciousness / other
    { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
    {
        "folke/persistence.nvim",
        event = "BufReadPost", -- only start the plugin when opening a file
        opts = {
            -- add any custom options here
        },
    },
}
