-- user event that loads after UIEnter + only if file buf is there (thx nvchad)
vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
    callback = function(args)
        local file = vim.api.nvim_buf_get_name(args.buf)
        local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })

        if not vim.g.ui_entered and args.event == "UIEnter" then vim.g.ui_entered = true end

        if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
            vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
            vim.api.nvim_del_augroup_by_name "NvFilePost"

            vim.schedule(function()
                vim.api.nvim_exec_autocmds("FileType", {})
                vim.cmd "silent! filetype detect"

                if vim.g.editorconfig then require("editorconfig").config(args.buf) end
            end)
        end
    end,
})
vim.schedule(function()
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
        callback = function()
            vim.opt.nu = false
            vim.opt.relativenumber = false
            vim.opt.number = true
        end,
    })

    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function()
            vim.opt.number = false
            vim.opt.nu = true
            vim.opt.relativenumber = true
        end,
    })

    -- dont list quickfix buffers
    vim.api.nvim_create_autocmd("FileType", {
        pattern = { "qf", "notify" },
        callback = function() vim.opt_local.buflisted = false end,
    })

    -- 4 space gang rules!
    vim.api.nvim_create_user_command("S2T", "%s/    /\\t/g", {}) -- space to tab
    vim.api.nvim_create_user_command("T2S", "%s/\\t/    /g", {}) -- tab to space
end)
