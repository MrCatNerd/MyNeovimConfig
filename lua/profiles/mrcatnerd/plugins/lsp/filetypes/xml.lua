local ls = require "luasnip"

ls.add_snippets(nil, {
    xml = {
        ls.parser.parse_snippet("<", "<$1 $0><$1/>"),
    },
})
