-- sorting function
return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    cmd = "Codeium",
    config = function(_, opts)
        require("codeium").setup(opts)
    end,
}
