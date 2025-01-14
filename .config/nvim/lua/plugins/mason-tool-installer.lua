return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			"efm",

			-- cpp
			"clangd",
			"clang-format",
			-- go
			"gopls",
			-- python
			"pyright",
			-- lua
			"lua-language-server",
			"stylua",
			-- sql
			"sqls",
			"sql-formatter",
			-- c#
			"csharp-language-server",
			-- bash
			"bash-language-server",
			-- json
			"json-lsp",
			-- toml
			"taplo",
			-- latex
			"texlab",
		},
		auto_update = true,
		run_on_start = true,
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			cmd = "Mason",
			event = "BufReadPre",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
