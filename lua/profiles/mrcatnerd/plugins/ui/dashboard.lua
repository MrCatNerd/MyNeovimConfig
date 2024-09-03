local function merge_tables(table1, table2, padding)
    local result = {}
    for i = 1, #table1 do
        result[i] = table1[i] .. string.rep(" ", padding) .. table2[i]
    end
    return result
end

local nvim_header = {
    "     █████            ███     ",
    "   ██▓▓▓▓▓█           █..██   ",
    " ██▓▓▓▓▓▓▓▓██         █  ..██ ",
    "█▒██▓▓▓▓▓▓▓▓▓█        █    ..█",
    "█▒▒▒██▓▓▓▓▓▓▓▓██      █      █",
    "█▒▒▒▒██▓▓▓▓▓▓▓▓▓██    █      █",
    "█▒▒▒▒▒▒██▓▓▓▓▓▓▓▓▓█   █      █",
    "█▒▒▒▒▒▒█ ██▓▓▓▓▓▓▓▓██ █      █",
    "█▒▒▒▒▒▒█   █▓▓▓▓▓▓▓▓▓██      █",
    "█▒▒▒▒▒▒█    ██▓▓▓▓▓▓▓▓███    █",
    "█▒▒▒▒▒▒█      ██▓▓▓▓▓▓▓▓██   █",
    "█░░▒▒▒▒█        █▓▓▓▓▓▓▓▓▓██ █",
    " ██░░▒▒█         ██▓▓▓▓▓▓▓▓██ ",
    "   ██░░█           █▓▓▓▓▓██   ",
    "     ███            █████     ",
    "                              ",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
}

local cat_header = {
    "    ████                  ████    ",
    "  ██▒▒▒▒██              ██▒▒▒▒██  ",
    "  ██▒▒▒▒▒▒██          ██▒▒▒▒▒▒██  ",
    "  ██▒▒▒▒▒▒▒▒██████████▒▒▒▒▒▒▒▒██  ",
    "  ██▒▒▒▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒▒▒▒▒▒██  ",
    "  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
    "  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██  ",
    "██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██",
    "██████████████████████████████████",
    "████  ██  ██████▒▒██  ██  ████████",
    "██▒▒██  ██████▒▒██▒▒██  ██████░░██",
    "██▒▒░░██████▒▒▒▒▒▒▒▒▒▒██████░░░░██",
    "██▒▒░░░░░░▒▒▒▒▒▒██▒▒▒▒▒▒▒▒░░░░░░██",
    "  ██▒▒▒▒▒▒▒▒▒▒██████▒▒▒▒▒▒▒▒▒▒██  ",
    "    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",
    "    ██████████████████████████    ",
    "",
    " ▄▄    ▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ",
    "█  █  █ █  █ █  █       █       █       █",
    "█   █▄█ █  █▄█  █       █   ▄   █▄     ▄█",
    "█       █       █     ▄▄█  █▄█  █ █   █  ",
    "█  ▄    █       █    █  █       █ █   █  ",
    "█ █ █   ██     ██    █▄▄█   ▄   █ █   █  ",
    "█▄█  █▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█▄▄█ █▄▄█ █▄▄▄█  ",
    "",
}

local text_header = {}

return {
    "nvimdev/dashboard-nvim",
    -- event = "VimEnter", -- default but UIEnter is faster
    event = "UIEnter",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    cmd = {
        "Dashboard",
        "DbProjectDelete",
        "DashboardUpdateFooter",
    },
    config = function()
        vim.defer_fn(function()
            require("dashboard").setup {
                theme = "doom",
                config = {
                    --[[ week_header = {
						enable = true, --boolean use a week header
					}, ]]

                    -- comment week_header to enable this cat
                    header = merge_tables(nvim_header, cat_header, 3),
                    -- header = cat_header,

                    center = {
                        {
                            icon = "󰦛 ",
                            icon_hl = "Title",
                            desc = "Restore Session",
                            desc_hl = "String",
                            key = "ss",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "lua require('persistence').load()",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "New File",
                            desc_hl = "String",
                            key = "n",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = ":silent enew",
                        },
                        {
                            icon = "󰂠 ",
                            icon_hl = "Title",
                            desc = "Lazy",
                            desc_hl = "String",
                            key = "l",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "Lazy",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Sync",
                            desc_hl = "String",
                            key = "u",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "Lazy sync",
                        },
                        {
                            icon = "󰢛 ",
                            icon_hl = "Title",
                            desc = "Mason",
                            desc_hl = "String",
                            key = "m",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "Mason",
                        },
                        {
                            icon = " ",
                            icon_hl = "Title",
                            desc = "Git",
                            desc_hl = "String",
                            key = "gs",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "lua require('neogit').open()",
                        },
                        {
                            icon = "󰗼 ",
                            icon_hl = "Title",
                            desc = "Exit",
                            desc_hl = "String",
                            key = "q",
                            key_hl = "Number",
                            -- key_format = " %s", -- remove default surrounding `[]`
                            action = "q",
                        },
                    },
                },
            }
        end, 2000)
    end,
}
