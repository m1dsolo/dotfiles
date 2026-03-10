return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip/loaders/from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
				-- ["<Tab>"] = vim.schedule_wrap(function(fallback)
				-- 	if cmp.visible() and has_words_before() then
				-- 		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 	else
				-- 		fallback()
				-- 	end
				-- end),
				-- ["<C-k>"] = cmp.mapping.scroll_docs(-4),
				-- ["<C-j>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.complete(),
				-- ["<C-e>"] = cmp.mapping.abort(), -- close completion window
				-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				["<C-l>"] = cmp.mapping.confirm({ select = true }),
				-- ["<C-e>"] = cmp.mapping(confirm_first_word, { "i", "c" }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "luasnip" },
				{ name = "copilot", keyword_length = 0 },
				{ name = "nvim_lsp" },
				{
					name = "buffer",
					option = {
						-- get visible buffers
						-- get_bufnrs = function()
						-- 	local bufs = {}
						-- 	for _, win in ipairs(vim.api.nvim_list_wins()) do
						-- 		bufs[vim.api.nvim_win_get_buf(win)] = true
						-- 	end
						-- 	return vim.tbl_keys(bufs)
						-- end,
						-- get all buffers
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{ name = "vim-dadbod-completion" },
			}),
			experimental = {
				ghost_text = true,
			},
		})
	end,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		{

			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
	},
}
