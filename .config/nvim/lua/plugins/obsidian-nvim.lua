return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "vault",
				path = "~/vault",
			},
		},
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["p"] = {
				action = function()
					local function IsPngImage(contents)
						local pngSignature = string.char(0x89) .. "PNG\r\n\x1a\n"
						return contents:sub(1, #pngSignature) == pngSignature
					end

					local clipboardContent = vim.fn.getreg("+")
					if IsPngImage(clipboardContent) then
						vim.cmd(":ObsidianPasteImg")
					else
						vim.cmd("normal! p")
					end
				end,
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
		},
	},
}
