-- Encapsulate file type detection function
---@param filetypes string|table Target file extensions (e.g. "cpp" or { "cpp", "h", "hpp" })
---@return boolean
has_filetype = function(filetypes)
	-- Return false if no buffer is open
	if not vim.api.nvim_get_current_buf() then
		return false
	end
	-- Get the extension of the current file (without dot)
	local ext = vim.fn.expand("%:e")
	if ext == "" then
		return false
	end

	-- Explicitly convert to table and add type annotation to eliminate lsp warning
	---@type table<string>
	local target_exts = {}
	if type(filetypes) == "string" then
		table.insert(target_exts, filetypes)
	else
		target_exts = filetypes
	end

	-- Check if current extension is in target list
	for _, ft in ipairs(target_exts) do
		if ext == ft then
			return true
		end
	end
	return false
end

return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	opts = {

		ensure_installed = {
			"efm",

			-- C/C++
			{
				"clangd",
				condition = function()
					-- Match common C/C++ extensions
					return has_filetype({ "cpp", "h", "hpp", "cxx", "hxx", "cc" })
				end,
			},
			{
				"clang-format",
				condition = function()
					return has_filetype({ "cpp", "h", "hpp", "cxx", "hxx", "cc" })
				end,
			},
			-- Rust
			{
				"rust-analyzer",
				condition = function()
					return has_filetype("rs")
				end,
			},
			-- Go
			{
				"gopls",
				condition = function()
					return has_filetype("go")
				end,
			},
			-- Python
			{
				"pyright",
				condition = function()
					return has_filetype("py")
				end,
			},
			-- Lua
			{
				"lua-language-server",
				condition = function()
					return has_filetype("lua")
				end,
			},
			{
				"stylua",
				condition = function()
					return has_filetype("lua")
				end,
			},
			-- C#
			{
				"csharp-language-server",
				condition = function()
					return has_filetype("cs")
				end,
			},
			-- Bash
			{
				"bash-language-server",
				condition = function()
					return has_filetype({ "sh", "bash" })
				end,
			},
			-- Docker
			{
				"dockerfile-language-server",
				condition = function()
					-- Match .dockerfile extension or Dockerfile (no extension)
					return has_filetype("dockerfile") or vim.fn.expand("%:t") == "Dockerfile"
				end,
			},
			-- JSON
			{
				"json-lsp",
				condition = function()
					return has_filetype("json")
				end,
			},
			{
				"fixjson",
				condition = function()
					return has_filetype("json")
				end,
			},
			-- TOML
			{
				"taplo",
				condition = function()
					return has_filetype("toml")
				end,
			},
			-- Markdown
			{
				"marksman",
				condition = function()
					return has_filetype("md")
				end,
			},
			-- LaTeX
			{
				"texlab",
				condition = function()
					return has_filetype({ "tex", "latex", "bib" })
				end,
			},
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
