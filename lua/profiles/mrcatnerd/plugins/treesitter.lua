return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate | TSInstallAll",
    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "asm",
            "bash",
            "c",
            "c_sharp",
            "cmake",
            "commonlisp",
            "cpp",
            "css",
            "csv",
            "diff",
            "dockerfile",
            "gdscript",
            "gdshader",
            "gitignore",
            "glsl",
            "go",
            "hlsl",
            "html",
            "java",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "kotlin",
            "lua",
            "luadoc",
            "luap",
            "make",
            "markdown",
            "markdown_inline",
            "meson",
            "nix",
            "python",
            "query",
            "rasi",
            "regex",
            "rust",
            "sql",
            "tmux",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
        },
        -- TODO: disable treesitter on files > 100KB
    },
    config = function(_, opts)
        require("nvim-treesitter").setup { opts }

        vim.api.nvim_create_user_command("TSInstallAll", function()
            -- if I wanna go the lazy loading route
            -- local spec = require("lazy.core.config").plugins["nvim-treesitter"]
            -- local opts = type(spec.opts) == "table" and spec.opts or {}

            require("nvim-treesitter").install(opts.ensure_installed)
        end, {})

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function() pcall(vim.treesitter.start) end,
        })
    end,
}
