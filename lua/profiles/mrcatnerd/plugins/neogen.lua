return {
    "danymat/neogen",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = {
        {
            "<leader>gr",
            function()
                require("neogen").generate()
            end,
            desc = "Generate Docstring by Neogen",
        },
    },
    opts = {
        enabled = true, --if you want to disable Neogen (even tho Lazy.nvim has a better system)
        input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
        snippet_engine = "luasnip",
    },
}
