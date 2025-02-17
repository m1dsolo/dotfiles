return {
	"rcarriga/nvim-notify",
	opts = {
		background_colour = "#000000",
		stages = "slide", -- `fade` in st is not good
	},
	keys = {
		{
			"<leader><CR>",
			function()
				require("notify").dismiss({ pending = true, silent = true })
				vim.cmd("nohlsearch") -- how to call config in configs/keymaps.lua?
			end,
		},
	},
	-- vim.keymap.set()
}
