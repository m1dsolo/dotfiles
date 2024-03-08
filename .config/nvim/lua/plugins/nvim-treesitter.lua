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
                "python",
                "cpp",
                "c",
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
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = true,
            }
        })
    end
}
