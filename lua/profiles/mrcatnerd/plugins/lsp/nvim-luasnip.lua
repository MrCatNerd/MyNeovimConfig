return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = "rafamadriz/friendly-snippets",
    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
    config = function(_, opts)
        local ls = require "luasnip"

        ls.config.set_config { history = true, updateevents = "TextChanged,TextChangedI" }

        -- vscode format
        require("luasnip.loaders.from_vscode").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

        -- snipmate format
        require("luasnip.loaders.from_snipmate").load()
        require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

        -- lua format
        require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                if
                    require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                    and not require("luasnip").session.jump_active
                then
                    require("luasnip").unlink_current()
                end
            end,
        })

        -- <C-k> is my expansion key
        -- this will expand the current item or jump to the next item within the snippet.

        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            if ls.expand_or_jumpable() then ls.expand_or_jump() end
        end, { silent = true })

        -- <c-j> is my jump backwards key.
        -- this always moves to the previous item within the snippet
        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            if ls.jumpable(-1) then ls.jump(-1) end
        end, { silent = true })

        vim.keymap.set("i", "<C-u>", require "luasnip.extras.select_choice")

        -- <c-l> is selecting within a list of options.
        -- This is useful for choice nodes (introduced in the forthcoming episode 2)
        vim.keymap.set("i", "<C-l>", function()
            if ls.choice_active() then ls.change_choice(1) end
        end)

        -- after
        vim.schedule(function() require "profiles.mrcatnerd.plugins.lsp.filetypes" end)
    end,
}
