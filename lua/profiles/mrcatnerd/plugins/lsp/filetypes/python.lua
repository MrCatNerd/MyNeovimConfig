local ls = require("luasnip")

local spaces_in_tabs = string.rep(" ", vim.o.shiftwidth)

ls.add_snippets("python", {
	ls.parser.parse_snippet("open-file", string.format("with open($1, $2) as $3:\n%s$0", spaces_in_tabs)),
})
