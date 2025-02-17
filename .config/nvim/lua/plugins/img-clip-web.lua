return {
	dir = vim.fn.stdpath("config") .. "/dev/img-clip-web",
	lazy = false,
	opts = {
		web_url = "https://m1dsolo.xyz/images",
		base_dir = "/var/www/images",
	},
	keys = {
		{ "<leader>P", ":PasteImageWeb<CR>" },
	},
}
