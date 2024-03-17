return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	init = function()
		vim.keymap.set("n", "gf", function()
			if require("obsidian").util.cursor_on_markdown_link() then
				return "<cmd>ObsidianFollowLink<CR>"
			else
				return "gf"
			end
		end, { noremap = false, expr = true })
	end,
	opts = {
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
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
