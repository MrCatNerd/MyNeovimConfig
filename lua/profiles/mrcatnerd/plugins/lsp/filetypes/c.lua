local ls = require("luasnip")

local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local i, t, c = ls.insert_node, ls.text_node, ls.choice_node

ls.add_snippets("c", {
    s(
        "for",
        fmt(
            [[
    for (int {} = {}; {}; {}){{
        {}
    }}
    ]],
            {
                i(1, "i"),
                c(2, { t("0"), i(2, "num") }),
                i(3, "equals"),
                i(4, "action"),
                i(0),
            }
        )
    ),
})
