local ls = require "luasnip"

local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local i, t, c = ls.insert_node, ls.text_node, ls.choice_node

ls.add_snippets("c", {
    ls.parser.parse_snippet("->", "$1->$0"),
    ls.parser.parse_snippet("vp", "void*$0"),
    ls.parser.parse_snippet("vpc", "(void*)$0"),
    ls.parser.parse_snippet("clang-ignore", "// clang-format off\n$0\n// clang-format on"),
})
