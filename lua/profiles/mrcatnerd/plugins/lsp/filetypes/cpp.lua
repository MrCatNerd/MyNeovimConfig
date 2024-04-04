local ls = require("luasnip")

ls.add_snippets("cpp", {
	ls.parser.parse_snippet("->", "$1->$0"),
})
