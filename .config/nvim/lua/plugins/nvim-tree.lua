return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	opts = {
		filters = {
			dotfiles = false,
		},
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.del("n", "H", { buffer = bufnr })
			vim.keymap.del("n", "J", { buffer = bufnr })
			vim.keymap.del("n", "K", { buffer = bufnr })
			vim.keymap.del("n", "L", { buffer = bufnr })
		end,
	},
	keys = {
		{ "<leader>m", ":NvimTreeToggle<CR>" },
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
