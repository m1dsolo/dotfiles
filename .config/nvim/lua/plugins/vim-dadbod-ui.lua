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
	end,
	keys = function()
		return {
			{ "<leader>d", "<cmd>DBUIToggle<CR>", { noremap = true, slient = true } },
			{ "<leader><leader>", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, { noremap = true, slient = true } },
			{ "<Return>", "<Plug>(DBUI_SelectLine)", { noremap = true, slient = true } },
			{ "d", "<Plug>(DBUI_DeleteLine)", ft = "dbui", { noremap = true, slient = true } },
			{ "A", "<Plug>(DBUI_AddConnection)", ft = "dbui", { noremap = true, slient = true } },
			{ "<Return>", "<Plug>(DBUI_SelectLine)", ft = "dbui" },
		}
	end,
}
