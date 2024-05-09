M = {}

function M.keymap(m, k, v, buffer)
	buffer = buffer or false
	vim.keymap.set(m, k, v, { noremap = true, silent = true, buffer = buffer })
end

function M.split(str, c)
	local res = {}
	local _ = string.gsub(str, "[^" .. c .. "]+", function(w)
		table.insert(res, w)
	end)
	return res
end

function M.get_temp_name()
	local temp_name = vim.fn.tempname()
	local parts = M.split(temp_name, "/")
	temp_name = parts[#parts - 1]
	return temp_name
end

return M
