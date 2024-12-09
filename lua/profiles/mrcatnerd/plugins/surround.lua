return {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = {
        { "cs", desc = "Change surrounding" },
        { "ds", desc = "Delete surrounding" },
        { "ys", desc = "Add surrounding" },
    },
    opts = {},
    config = function(_, opts) require("nvim-surround").setup(opts) end,
}
