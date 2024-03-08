return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = {
		filters = {
			dotfiles = false,
		},
	},
	keys = {
		{ "<leader>m", ":NvimTreeToggle<CR>" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
