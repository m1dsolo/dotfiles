return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {
		ensure_installed = {
			"efm",

			-- cpp
			"clangd",
			"clang-format",
			-- rust
			"rust-analyzer",
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
			-- docker
			"dockerfile-language-server",
			-- json
			"json-lsp",
            "fixjson",
			-- toml
			"taplo",
			-- markdown,
			"marksman",
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
