return {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstallAll", "MasonUpdate" },
    opts = { -- THX NVCHAD
        PATH = "skip",
        ensure_installed = {
            -- "csharp-language-server",
            -- "bash-language-server",
            "biome",
            "jdtls",
            "gdtoolkit",
            "typescript-language-server",
            "black",
            "clangd",
            "clang-format",
            "cmake-language-server",
            "gopls",
            "lua-language-server",
            "pyright",
            "rust-analyzer",
            "stylua",
            "glsl_analyzer",
            "codelldb",
            "java-language-server",
            "marksman",
            "asm-lsp",
            "asmfmt",
            "mesonlsp",
            "zls",
        }, -- not an option from mason.nvim (shamelessly stolen from nvchad)

        ui = {
            icons = {
                package_pending = " ",
                package_installed = "󰄳 ",
                package_uninstalled = " 󰚌",
            },

            -- keymaps = {
            -- 	toggle_server_expand = "<CR>",
            -- 	install_server = "I",
            -- 	update_server = "U",
            -- 	check_server_version = "c",
            -- 	update_all_servers = "U",
            -- 	check_outdated_servers = "C",
            -- 	uninstall_server = "X",
            -- 	cancel_installation = "<C-c>",
            -- },
        },

        max_concurrent_installers = 10,
    },
    config = function(_, opts)
        require("mason").setup(opts)

        vim.api.nvim_create_user_command("MasonInstallAll", function()
            if opts.ensure_installed and #opts.ensure_installed > 0 then
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end
        end, { desc = "Install all mason stuff specified in `opts.ensure_installed`" })

        vim.g.mason_binaries_list = opts.ensure_installed
    end,
}
