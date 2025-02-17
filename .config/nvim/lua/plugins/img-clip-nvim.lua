return {
	"HakonHarnes/img-clip.nvim",
	event = "VeryLazy",
	opts = {
		default = {
			dir_path = "assets",
			insert_mode_after_paste = false,
		},
		filetypes = {
			markdown = {
				url_encode_path = true,
				template = "![$FILE_NAME_NO_EXT]($FILE_PATH)",
				download_images = false,
			},
		},
	},
	keys = {
		{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
	},
}
