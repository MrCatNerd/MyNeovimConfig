local ls = require("luasnip")

local s = ls.s
local sn = ls.sn

local fmt = require("luasnip.extras.fmt").fmt

local rep = require("luasnip.extras").rep

local spaces_in_tabs = string.rep(" ", vim.o.shiftwidth)

local i, t, c, f, d = ls.insert_node, ls.text_node, ls.choice_node, ls.function_node, ls.dynamic_node

ls.add_snippets(nil, {
    all = {
        -- my snippets:
        ls.parser.parse_snippet("file", "$TM_FILENAME"),

        -- my snippeets kinda:

        -- we got other friendly-snippets
        -- s("datime", {
        --     f(function()
        --         return { os.date("%D - %H:%M") }
        --     end, {}),
        -- }),
        --
        -- -- snippets i stole from the internet:
        --
        -- s(
        --     "date",
        --     f(function()
        --         return { os.date("%Y-%m-%d") }
        --     end, {})
        -- --[[ f(function()
        --         return { os.date("%D") }
        --     end, {}) ]]
        -- ),
    },
})
