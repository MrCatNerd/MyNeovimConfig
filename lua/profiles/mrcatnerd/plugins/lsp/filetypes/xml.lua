local ls = require "luasnip"

ls.add_snippets(nil, {
    xml = {
        ls.parser.parse_snippet("<", "<$1 $2>$0<$1/>"),
    },
})
