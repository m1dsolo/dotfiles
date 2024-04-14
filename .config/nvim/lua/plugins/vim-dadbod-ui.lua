local keymap = require("utils").keymap

return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_auto_execute_table_helpers = 1
		vim.g.db_ui_table_helpers = {
			mariadb = {
				List = "select * from {table};",
				Columns = "desc {table};",
			},
		}
		vim.g.db_ui_disable_mappings = 1

		-- dbout no fold
		local group = vim.api.nvim_create_augroup("my_dbui", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
			pattern = "*.dbout",
			group = group,
			callback = function()
				vim.o.foldenable = false
			end,
		})
	end,
	keys = function()
		return {
			{ "<leader>q", "<cmd>DBUIToggle<CR>", { noremap = true, slient = true } },
			{ "<leader><leader>", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, { noremap = true, slient = true } },
			{ "<C-s>", "<Plug>(DBUI_SaveQuery)", { noremap = true, slient = true } },
			{ "d", "<Plug>(DBUI_DeleteLine)", ft = "dbui", { noremap = true, slient = true } },
			{ "A", "<Plug>(DBUI_AddConnection)", ft = "dbui", { noremap = true, slient = true } },
			{ "<Return>", "<Plug>(DBUI_SelectLine)", ft = "dbui", { noremap = true, slient = true } },
			{ "R", "<Plug>(DBUI_Redraw)", ft = "dbui", { noremap = true, slient = true } },
			{ "<leader>D", "<Plug>(DBUI_ToggleDetails)", ft = "dbui", { noremap = true, slient = true } },
			{ "<leader>E", "<Plug>(DBUI_EditBindParameters)", ft = "dbui", { noremap = true, slient = true } },
			{ "<leader>v", "<Plug>(DBUI_ToggleResultLayout)", { noremap = true, slient = true } },
		}
	end,
}
