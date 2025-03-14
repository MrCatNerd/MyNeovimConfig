return {
    {
        "saecki/crates.nvim",
        tag = "stable",
        event = "BufReadPost Cargo.toml",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("crates").setup {
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            }
        end,
    },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach",
        config = function() require("fidget").setup() end,
    },
}
