local M = {}

local function split_window()
	vim.cmd("set splitbelow")
	vim.cmd("sp")
	vim.cmd("res -5")
end

local get_temp_name = require("utils").get_temp_name

function M.setup(opts)
	vim.keymap.set("n", "<leader><leader>", function()
		local ft = vim.bo.filetype
		vim.cmd("w")
		if ft == "cpp" then
			split_window()
			local temp_name = get_temp_name()
			vim.cmd(string.format(
				-- %: is the current file name
				-- %<: is the current file name without extension
				"term clang++ -Wall -g -std=c++23 %% -o %s && ./%s < ~/.cache/data; rm %s",
				temp_name,
				temp_name,
				temp_name
			))
		elseif ft == "c" then
			split_window()
			local temp_name = get_temp_name()
			vim.cmd(
				string.format("term clang -Wall -g -std=c23 %% -o %s && ./%s; rm %s", temp_name, temp_name, temp_name)
			)
		elseif ft == "cs" then
			split_window()
			vim.cmd("term dotnet run")
        elseif ft == "sh" then
            split_window()
            vim.cmd("term zsh %")
		elseif ft == "go" then
			split_window()
			vim.cmd("term go run %")
		elseif ft == "python" then
			split_window()
			vim.cmd("term python %")
		elseif ft == "lua" then
			split_window()
			vim.cmd("term lua %")
		elseif ft == "markdown" then
			vim.cmd("MarkdownPreviewToggle")
		end
	end, { noremap = true, silent = true })
end

return M
