return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
	keys = function()
		local ls = require("luasnip")
		return {
			{
				"<A-j>",
				function()
					ls.jump(1)
				end,
				desc = "Jump forward a snippet placement",
				mode = "i",
				noremap = true,
				silent = true,
			},
			{
				"<A-k>",
				function()
					ls.jump(-1)
				end,
				desc = "Jump backward a snippet placement",
				mode = "i",
				noremap = true,
				silent = true,
			},
			{
				"<A-l>",
				function()
					if ls.choice_active() then
						ls.change_choice(1)
					end
				end,
				desc = "",
				mode = "i",
				noremap = true,
				silent = true,
			},
		}
	end,
	opts = {
		history = true,
		delete_check_events = "TextChanged",
		enable_autosnippets = true,
		store_selection_keys = "<Tab>",
	},
	config = function()
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })
		require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/.config/nvim/snippets/algorithm" } })

		-- press u to only undo 1 level?
		local auto_expand = require("luasnip").expand_auto
		require("luasnip").expand_auto = function(...)
			vim.o.undolevels = vim.o.undolevels
			auto_expand(...)
		end
	end,
}
