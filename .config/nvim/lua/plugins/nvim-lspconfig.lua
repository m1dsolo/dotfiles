local keymap = require("utils").keymap

return {
	"neovim/nvim-lspconfig",
	lazy = false,
	opts = {
		servers = {
			-- C/C++
			clangd = {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
				},
			},
			-- Rust
			rust_analyzer = {},
			-- Go
			gopls = {},
			-- Python
			pyright = {
				settings = {
					pyright = {
						disableOrganizeImports = false,
						analysis = {
							useLibraryCodeForTypes = true,
							autoSearchPaths = true,
							diagnosticMode = "workspace",
							autoImportCompletions = true,
						},
					},
				},
			},
			-- Typescript
			ts_ls = {},
			-- Lua
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
						completion = { callSnippet = "Replace" },
					},
				},
			},
			-- Bash
			bashls = {
				filetypes = {
					"sh",
					"aliasrc",
				},
			},
			-- Sql
			sqls = {},
			-- Docker
			dockerls = {},
			-- Markdown
			marksman = {},
			-- Json
			jsonls = {
				filetypes = { "json", "jsonc" },
			},
			-- Toml
			taplo = {},
		},
	},
	config = function(_, opts)
		local function on_attach(client, bufnr)
			local function keymap(m, k, v)
				vim.keymap.set(m, k, v, { noremap = true, silent = true, buffer = bufnr })
			end
			keymap("n", "gD", vim.lsp.buf.declaration)
			keymap("n", "gd", vim.lsp.buf.definition)
			keymap("n", "gh", vim.lsp.buf.hover)
			keymap("n", "gi", vim.lsp.buf.implementation)
			keymap("n", "gr", vim.lsp.buf.references)
			keymap("n", "gt", vim.lsp.buf.type_definition)
			keymap("n", "gs", vim.lsp.buf.signature_help)
			keymap("n", "gc", vim.lsp.buf.code_action)
			-- keymap("n", "<leader>ff", vim.lsp.buf.format)
			keymap("n", "<leader>rn", vim.lsp.buf.rename)
		end

		local lspconfig = require("lspconfig")
		for server, config in pairs(opts.servers) do
			config.on_attach = on_attach
			-- config.capabilities = require("blink.cmp").get_lsp_capabilities()
			config.capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig[server].setup(config)
		end

		keymap("n", "gF", vim.diagnostic.open_float)
		keymap("n", "gn", vim.diagnostic.goto_next)
		keymap("n", "gN", vim.diagnostic.goto_prev)
		keymap("n", "gl", vim.diagnostic.setloclist)

		-- efm
		local stylua = require("efmls-configs.formatters.stylua")
		local eslint = require("efmls-configs.linters.eslint")
		local prettier_d = require("efmls-configs.formatters.prettier_d")
		local fixjson = require("efmls-configs.formatters.fixjson")
		local shellcheck = require("efmls-configs.linters.shellcheck")
		local shfmt = require("efmls-configs.formatters.shfmt")
		local hadolint = require("efmls-configs.linters.hadolint")
		local sql_formatter = require("efmls-configs.formatters.sql-formatter")
		local taplo = require("efmls-configs.formatters.taplo")
		local rustfmt = require("efmls-configs.formatters.rustfmt")

		local languages = {
			lua = { stylua },
			sh = { shellcheck, shfmt },
			sql = { sql_formatter },
			docker = { hadolint, prettier_d },
			markdown = { prettier_d },
			json = { eslint, fixjson },
			jsonc = { eslint, fixjson },
			toml = { taplo },
			rust = { rustfmt },
		}

		lspconfig.efm.setup({
			filetypes = vim.tbl_keys(languages),
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
				hover = true,
				documentSymbol = true,
				codeAction = true,
				completion = true,
			},
			settings = {
				languages = languages,
			},
		})
	end,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"saghen/blink.cmp",
		-- "hrsh7th/cmp-buffer",
		-- "hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
}
