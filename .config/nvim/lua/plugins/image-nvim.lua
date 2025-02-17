return {
	"3rd/image.nvim",
	lazy = true,
	ft = "markdown",
	opts = {
		backend = "ueberzug",
		processor = "magick_rock",
		max_width_window_percentage = 100,
		window_overlap_clear_enabled = true,
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "", "notify" },
		integrations = {
			markdown = {
				only_render_image_at_cursor = false,
				download_remote_images = true,
				-- resolve_image_path = function(document_path, image_path, fallback)
				-- 	return vim.fn.expand("~") .. "/vault/" .. image_path
				-- end,
			},
		},
	},
}
