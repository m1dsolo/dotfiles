return {
	"CopilotC-Nvim/CopilotChat.nvim",
	dependencies = {
		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	},
	opts = {
		debug = true, -- Enable debugging
		-- See Configuration section for rest
		window = {
			layout = "float",
			relative = "editor",
			width = 0.8,
			height = 0.8,
		},
	},
	keys = {
		{
			"<leader>cc",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				else
					require("CopilotChat").open()
				end
			end,
			mode = "n",
		},
		{
			"<leader>cc",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					-- require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
				end
			end,
			mode = "v",
		},
	},
}
