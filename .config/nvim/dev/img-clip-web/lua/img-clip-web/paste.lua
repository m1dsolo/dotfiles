local config = require("img-clip-web.config")

local M = {}

---@return string | nil output
---@return number exit_code
function M.execute(input_cmd)
	local cmd = "sh -c " .. vim.fn.shellescape(input_cmd)

	local output = vim.fn.system(cmd)
	local exit_code = vim.v.shell_error

	return output, exit_code
end

function M.add_file_ext(str, ext)
	str = vim.fn.fnamemodify(str, ":r")
	return str .. "." .. ext
end

---@return boolean
function M.paste_image_from_clipboard(file_name)
	local command = string.format('xclip -selection clipboard -o -t image/png > "%s"', file_name)
	local _, exit_code = M.execute(command)
	return exit_code == 0
end

function M.paste_image()
	local file_name = vim.fn.input({ prompt = "input file name" })

	-- add file extension if not provided
	if vim.fn.fnamemodify(file_name, ":e") == "" then
		file_name = M.add_file_ext(file_name, "png")
	end

	-- save to current directory
	local res = M.paste_image_from_clipboard(file_name)
	if not res then
		vim.notify("Failed to paste image from clipboard", "error")
		return
	end

	-- if this file is index.md, use the parent directory name, otherwise use the current directory name
	local dir = vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
	if dir == "index" then
		dir = vim.fn.fnamemodify(vim.fn.expand("%:p:h"), ":t")
	end

	-- upload to server
	local server_path = string.format("%s/%s", config.default["base_dir"], dir)
	vim.notify(string.format("upload_image %s %s", file_name, server_path))
	if not M.execute(string.format("upload_image %s %s", file_name, server_path)) then
		vim.notify("Failed to upload image to server", "error")
		return
	end

	-- add image to markdown file
	local a = vim.fn.fnamemodify(file_name, ":t")
	vim.fn.execute(string.format("normal! i![%s](%s/%s/%s)", a, config.default["web_url"], dir, file_name))
end

return M
