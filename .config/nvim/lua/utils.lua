M = {}

function M.keymap(m, k, v, buffer)
    buffer = buffer or false
	vim.keymap.set(m, k, v, { noremap = true, silent = true, buffer = buffer })
end

return M
