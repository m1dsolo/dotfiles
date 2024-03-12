local M = {}

local function split()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end

function M.setup(opts)
	vim.keymap.set("n", "<leader><leader>", function()
		local ft = vim.bo.filetype
		vim.cmd("w")
		if ft == "cpp" then
			split()
			vim.cmd("term clang++ -Wall -g -std=c++17 % -o %< && ./%< < ~/.cache/data && rm %<")
		elseif ft == "c" then
			split()
			vim.cmd("term clang -Wall -g -std=c17 % -o %< && ./%< && rm %<")
		elseif ft == "python" then
			split()
			vim.cmd("term python %")
		elseif ft == "lua" then
			split()
			vim.cmd("term lua %")
		elseif ft == "markdown" then
			vim.cmd("MarkdownPreviewToggle")
		end
	end, { noremap = true, silent = true })
end

return M
