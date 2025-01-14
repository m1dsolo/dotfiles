return {
	"lervag/vimtex",
	lazy = true,
	ft = "tex",
	init = function()
		vim.g.vimtex_view_method = "zathura"
	end,
	config = function()
		local keymap = require("utils").keymap
		keymap("n", "<leader><leader>", "<plug>(vimtex-compile)")
	end,
}
