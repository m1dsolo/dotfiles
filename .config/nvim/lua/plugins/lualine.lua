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
		theme = "tokyonight",
		sections = {
			lualine_b = {
				{
					"macro-recording",
					fmt = show_macro_recording,
				},
			},
		},
	},
}
