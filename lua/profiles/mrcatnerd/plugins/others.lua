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
        "tikhomirov/vim-glsl",
        ft = "glsl",
        enabled = function() -- BECAUSE TREESITTER ISNT WORKING
            return vim.loop.os_uname().sysname == "Windows_NT"
        end
    },

    {
        "xiyaowong/transparent.nvim",
        event = "ColorScheme",
        config = function() require("transparent").setup() end,
    },

    {
        "numToStr/Comment.nvim",
        keys = {
            { "gcc", mode = "n",          desc = "Comment toggle current line" },
            { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
            { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
            { "gbc", mode = "n",          desc = "Comment toggle current block" },
            { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
            { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
        },
        config = function()
            require("Comment").setup()
        end,
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
            { "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggles undotree" }
        },
    },

    {
        "tpope/vim-fugitive",
        cmd = {
            "Git",
            "Gedit",
            "Gsplit",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "Glgrep",
            "GMove",
            "GDelete",
            "GBrowse",
        },
        keys = {
            { "<leader>gs", vim.cmd.Git, desc = "Toggles Git" }
        },
    },

    -- stupid stuff / maliciousness / other
    { "ThePrimeagen/vim-be-good", cmd = { "VimBeGood" } },
    {
        "eandrju/cellular-automaton.nvim",
        cmd = { "CellularAutomaton" },
        keys = {
            { "<leader>mr", function()
                require("cellular-automaton").start_animation("make_it_rain")
            end, "make it rain" },

        },
    },
    {
        -- "MrCatNerd/temp.nvim",
        "temp.nvim",
        dev = true,
        dependencies = "nvim-lua/plenary.nvim",
        keys = { -- best thing ever
            { "<leader>www", "<cmd>TempToggle<CR>", desc = "Toggles temp.nvim menu" },
        },
        cmd = { "TempToggle", "DBG" },
        config = function()
            require("temp").setup()
        end,
    },

    {
        "folke/persistence.nvim",
        event = "BufRead", -- this will only start session saving when an actual file was opened
        opts = {
            -- add any custom options here
        },
    },
}
