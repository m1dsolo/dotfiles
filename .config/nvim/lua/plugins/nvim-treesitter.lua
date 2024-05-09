return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
            ensure_installed = {
                "cpp",
                "c",
                "go",
                "python",
                "lua",
                "sql",
                "vim",
                "vimdoc",
                "bash",
                "markdown",
                "markdown_inline",
                "yaml",
                "json",
                "dockerfile",
                "diff",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            }
        })
        vim.g.markdown_folding = true
    end
}
