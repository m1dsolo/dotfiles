return {
	"3rd/image.nvim",
	lazy = true,
	ft = "markdown",
	opts = {
		backend = "ueberzug",
		max_width_window_percentage = 100,
		window_overlap_clear_enabled = true,
		window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "", "notify" },
		integrations = {
			markdown = {
				only_render_image_at_cursor = true,
				resolve_image_path = function(document_path, image_path, fallback)
					return vim.fn.expand("~") .. "/vault/" .. image_path
				end,
			},
		},
	},
	init = function()
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
		package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
	end,
}
