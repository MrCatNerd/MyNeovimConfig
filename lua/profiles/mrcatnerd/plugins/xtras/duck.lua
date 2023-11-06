return {
    "tamton-aquib/duck.nvim",
    -- keys = {
    --     { "<leader>ddd", function() require("duck").hatch("🐤") end, desc = "hatch duck" },
    --     { "<leader>ddk", function() require("duck").cook() end, desc = "cook duck" },
    -- },
    cmd = {
        "DuckGoBrrr",
        "EatDuckForBreakfast",
    },
    config = function()
        vim.api.nvim_create_user_command("DuckGoBrrr", function() require("duck").hatch("🐤") end, {})
        vim.api.nvim_create_user_command("EatDuckForBreakfast", function() require("duck").cook() end, {})
    end
}
