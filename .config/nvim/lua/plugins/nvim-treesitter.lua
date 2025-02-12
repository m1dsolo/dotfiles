return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
        -- folding
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	opts = {
		indent = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		ensure_installed = {
			"cpp",
			"c",
			"go",
			"python",
			"lua",
			"sql",
			"vim",
			"vimdoc",
			"bash",
			"markdown",
			"markdown_inline",
			"yaml",
			"json",
			"dockerfile",
			"diff",
			"toml",
			"latex",
		},
		auto_install = true,
		highlight = {
			enable = true,

			-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
			-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
			-- Using this option may slow down your editor, and you may see some duplicate highlights.
			-- Instead of true it can also be a list of languages
			additional_vim_regex_highlighting = true,
		},
		-- vim.g.markdown_folding = true
	},
}
