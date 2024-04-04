local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i, t, c = ls.insert_node, ls.text_node, ls.choice_node

ls.add_snippets("go", {
	s(
		"err",
		fmt("if {} != nil {{\n\t{}\n}}", {
			-- c(1, { t("err"), i(1) }), -- TODO: maybe this
			i(1, "err"),
			i(0),
		})
	),
})
