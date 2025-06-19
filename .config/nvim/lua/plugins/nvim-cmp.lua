return {
	"hrsh7th/nvim-cmp",
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip/loaders/from_vscode").lazy_load()

		vim.opt.completeopt = "menu,menuone,noselect"

		-- local function confirm_first_word()
		-- 	if cmp.core.view:visible() then
		-- 		local e = cmp.core.view:get_selected_entry()
		-- 		if not e then
		-- 			e = cmp.core.view:get_first_entry()
		-- 		end
		-- 		if e then
		-- 			-- -- local word = e:_get_word() -- 使用 entry 的 _get_word 函数
		-- 			-- -- -- print(word)
		-- 			-- -- print(e:get_insert_text())
		-- 			-- -- -- local first_word = string.match(word, "^%w+") or word
		-- 			--
		-- 			-- cmp.core:confirm(e, {
		-- 			-- 	behavior = "replace",
		-- 			-- }, function()
		-- 			-- 	cmp.core:complete(cmp.core:get_context({ reason = cmp.ContextReason.TriggerOnly }))
		-- 			-- end)
		-- 			local insert_text = e:get_insert_text()
		-- 			local first_word = string.match(insert_text, "^%w+") or insert_text
		--
		-- 			-- 获取当前光标位置
		-- 			local line = e.context.cursor.row
		-- 			local col = e.context.cursor.col
		--
		-- 			-- 创建新的 textEdit (如果需要)
		-- 			local new_text_edit = {
		-- 				newText = first_word,
		-- 				range = {
		-- 					start = { line = line - 1, character = e.insert_range.start.character },
		-- 					["end"] = { line = line - 1, character = e.insert_range.start.character + #first_word }, -- 调整结束位置
		-- 				},
		-- 			}
		--
		-- 			-- 修改 entry 的 completion_item
		-- 			e.completion_item.insertText = first_word
		-- 			e.completion_item.textEdit = new_text_edit
		--
		-- 			cmp.core:confirm(e, {
		-- 				behavior = "replace",
		-- 			}, function()
		-- 				cmp.core:complete(cmp.core:get_context({ reason = cmp.ContextReason.TriggerOnly }))
		-- 			end)
		-- 		end
		-- 	end
		-- end

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
