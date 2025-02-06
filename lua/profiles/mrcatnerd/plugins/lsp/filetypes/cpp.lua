local ls = require "luasnip"

ls.add_snippets("cpp", {
    ls.parser.parse_snippet("->", "$1->$0"),
    ls.parser.parse_snippet("clang-ignore", "// clang-format off\n$0\n// clang-format on"),
})
