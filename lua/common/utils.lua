local M = {}

M.load_mappings = function(section) -- TOOD: mapping thingy
    section = section or nil

    assert(section ~= nil, "you did not inserted section")

    vim.schedule(function()
        local mappings = require("core.mappings")


        if type(section) == "string" then
            return mappings[section]
        else
            error("section isnt a stringy")
        end
    end)
end

M.lazy_load = function(plugin)
    vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
        group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
        callback = function()
            local file = vim.fn.expand "%"
            local condition = file ~= "netrw" and "NvimTree_1" and file ~= "[lazy]" and
                file ~=
                "" -- idk why i left NvimTree there

            if condition then
                vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

                -- dont defer for treesitter as it will show slow highlighting
                -- This deferring only happens only when we do "nvim filename"
                if plugin ~= "nvim-treesitter" then
                    vim.schedule(function()
                        require("lazy").load { plugins = plugin }

                        if plugin == "nvim-lspconfig" then
                            vim.cmd "silent! do FileType"
                        end
                    end, 0)
                else
                    require("lazy").load { plugins = plugin }
                end
            end
        end,
    })
end

return M
