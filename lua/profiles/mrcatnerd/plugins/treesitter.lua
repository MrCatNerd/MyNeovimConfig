return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = {
        "EditQuery",
        "Inspect",
        "InspectTree",
        "TSBufDisable",
        "TSBufEnable",
        "TSDisable",
        "TSEnable",
        "TSInstall",
        "TSModuleInfo",
        "TSUpdate",
        "TSUpdateSync",
    },
    build = ":TSUpdate",
    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "bash",
            "c",
            "cmake",
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

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
        auto_install = false,

        highlight = {
            enable = true,
            use_languagetree = true,
            indent = { enable = true },
            highlight = { enable = true },

            additional_vim_regex_highlighting = false,

            -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then return true end
            end,
        },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
    enabled = vim.fn.has "win32" == 0,
}
