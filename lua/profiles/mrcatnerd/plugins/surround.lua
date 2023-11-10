return {
    "kylechui/nvim-surround",
    version = "*",     -- Use for stability; omit to use `main` branch for the latest features
    event = "BufRead", -- idk why but its faster than BufEnter
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
}
