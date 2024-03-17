return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		vim.g.lazygit_floating_window_use_plenary = 1
	end,
	keys = {
		{ "<leader>lg", "<cmd>:LazyGit<cr>", noremap = true, silent = true },
	},
}
