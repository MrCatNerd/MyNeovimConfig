local ls = require("luasnip")

local s = ls.s
local sn = ls.sn

local fmt = require("luasnip.extras.fmt").fmt


local i, t, c, d = ls.insert_node, ls.text_node, ls.choice_node, ls.dynamic_node

ls.add_snippets("rust", {
    s("test", fmt(
        [[
#[test]
fn {}(){}{{
    {}
}}]],
        {
            i(1, "testname"),
            (function(position)
                return d(position, function()
                    local nodes = {}
                    nodes[#nodes + 1] = t " "

                    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
                    for _, line in ipairs(lines) do
                        if line:match("anyhow::Result") then
                            nodes[#nodes + 1] = t " -> Result<()> "
                            break
                        end
                    end

                    return sn(nil, c(1, nodes))
                end, {})
            end)(2),
            i(0)
        }
    )),

    s(
        "modtest",
        fmt(
            [[
#[cfg(test)]
mod test {{
{}

    {}
}}]],
            {
                c(1, { t("    use super::*;"), t("") }),
                i(0),
            }
        )
    ),
})
