local ls = require "luasnip"
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local i = ls.insert_node
local spaces_in_tabs = string.rep(" ", vim.o.shiftwidth)

ls.add_snippets(nil, {
    lua = {
        -- my snippets:

        -- my snippeets kinda:
        ls.parser.parse_snippet("lf", string.format("local $1 = function ($2)\n%s$0\nend", spaces_in_tabs)), -- local function
        ls.parser.parse_snippet("mf", string.format("$1.$2 = function ($3)\n%s$0\nend", spaces_in_tabs)), -- mothod function

        s(
            "insertable",
            fmt("{}[#{} + 1] = {}", {
                i(1, "tablename"),
                rep(1),
                i(0, "value"),
            })
        ),
    },
})
