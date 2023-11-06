return {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.4",
    -- or                              , branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
    },
    extensions_list = { "themes", "terms", "fzf" },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
    opts = {
        defaults = {
            prompt_prefix = "$ ",
            selection_caret = "> ",
            mappings = {
                i = {
                    ["<C-a>"] = function()
                        print("meow")
                    end,
                },
            },
        },
    },
    keys = {
        {
            "<leader>ps",
            function()
                require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
            end,
            desc = "projects search",
        },
        { "<leader>pf", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
        { "<C-p>",      "<cmd>Telescope git_files<CR>",  desc = "Telescope git files" },
    },
    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)

        telescope.load_extension("fzf")
    end,
}
