return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                }
            }
        }
    },
    keys = {
        { "ff", ":Telescope find_files<CR>" },
        { "fg", ":Telescope live_grep<CR>" },
        { "fb", ":Telescope buffers<CR>" },
        { "fh", ":Telescope help_tags<CR>" },
    }
}
