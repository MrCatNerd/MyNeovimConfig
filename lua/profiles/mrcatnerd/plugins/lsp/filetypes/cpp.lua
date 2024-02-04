local ls = require("luasnip")

local s = ls.s

local fmt = require("luasnip.extras.fmt").fmt

local i, t, c = ls.insert_node, ls.text_node, ls.choice_node

ls.add_snippets("cpp", {
	ls.parser.parse_snippet("->", "$1->$0"),
})
