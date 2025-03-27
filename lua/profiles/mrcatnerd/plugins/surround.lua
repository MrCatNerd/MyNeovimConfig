return {
    "kylechui/nvim-surround",
    keys = {
        { "cs", desc = "Change surrounding" },
        { "ds", desc = "Delete surrounding" },
        { "ys", desc = "Add surrounding" },
    },
    opts = {},
    config = function(_, opts) require("nvim-surround").setup(opts) end,
}
