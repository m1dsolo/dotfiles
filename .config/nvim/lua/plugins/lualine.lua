local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "Recording @" .. recording_register
	end
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		theme = "gruvbox",
		sections = {
			lualine_b = {
				{
					"filename",
					path = 3,
				},
				{
					"macro-recording",
					fmt = show_macro_recording,
				},
			},
			lualine_c = {},
		},
	},
}
