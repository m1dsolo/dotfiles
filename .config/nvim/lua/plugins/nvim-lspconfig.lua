return {
	"neovim/nvim-lspconfig",
	lazy = false,
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local function keymap(m, k, v)
			vim.keymap.set(m, k, v, { noremap = true, silent = true })
		end
		keymap("n", "gf", vim.diagnostic.open_float)
		keymap("n", "gN", vim.diagnostic.goto_prev)
		keymap("n", "gn", vim.diagnostic.goto_next)
		keymap("n", "gl", vim.diagnostic.setloclist)

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
			-- keymap("n", "<leader>ff", vim.lsp.buf.format)
			keymap("n", "<leader>rn", vim.lsp.buf.rename)
		end

		-- lua
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
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
		})

		-- json
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "json", "jsonc" },
		})

		-- python
		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
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
		})

		-- bash
		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = {
				"sh",
				"aliasrc",
			},
		})

		-- docker
		lspconfig.dockerls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		-- sql
		lspconfig.sqls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- efm
		local stylua = require("efmls-configs.formatters.stylua")
		local eslint = require("efmls-configs.linters.eslint")
		local prettier_d = require("efmls-configs.formatters.prettier_d")
		local fixjson = require("efmls-configs.formatters.fixjson")
		local shellcheck = require("efmls-configs.linters.shellcheck")
		local shfmt = require("efmls-configs.formatters.shfmt")
		local hadolint = require("efmls-configs.linters.hadolint")
		local sql_formatter = require("efmls-configs.formatters.sql-formatter")

		lspconfig.efm.setup({
			filetypes = {
				"lua",
				"python",
				"json",
				"jsonc",
				"sh",
				"markdown",
				"docker",
				"c",
				"cpp",
			},
			init_options = {
				documentFormatting = true,
				documentRangeFormatting = true,
				hover = true,
				documentSymbol = true,
				codeAction = true,
				completion = true,
			},
			settings = {
				languages = {
					lua = { stylua },
					json = { eslint, fixjson },
					jsonc = { eslint, fixjson },
					sh = { shellcheck, shfmt },
					markdown = { prettier_d },
					docker = { hadolint, prettier_d },
					sql = { sql_formatter },
				},
			},
		})
	end,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
}
