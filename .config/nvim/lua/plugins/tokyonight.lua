return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            transparent = false,
        })
        vim.cmd([[colorscheme tokyonight]])
    end
}
