local keymap = require("utils").keymap
local group = vim.api.nvim_create_augroup("my_keymap", { clear = true })

-- move
keymap({ "n", "v" }, "H", "5h")
keymap({ "n", "v" }, "J", "5j")
keymap({ "n", "v" }, "K", "5k")
keymap({ "n", "v" }, "L", "5l")

-- split
keymap("n", "sh", ":set nosplitright<CR>:vsplit<CR>")
keymap("n", "sj", ":set splitbelow<CR>:split<CR>")
keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>")
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>")
keymap("n", "th", ":set nosplitright<CR>:vsplit<CR>:terminal<CR>i")
keymap("n", "tj", ":set splitbelow<CR>:split<CR>:terminal<CR>i")
keymap("n", "tk", ":set nosplitbelow<CR>:split<CR>:terminal<CR>i")
keymap("n", "tl", ":set splitright<CR>:vsplit<CR>:terminal<CR>i")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>")
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>")
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>")
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>")
keymap("n", "<up>", ":res -3<CR>")
keymap("n", "<down>", ":res +3<cr>")
keymap("n", "<left>", ":vertical resize-3<CR>")
keymap("n", "<right>", ":vertical resize+3<CR>")
-- keymap("n", "sv", "<C-w>t<C-w>H")
-- keymap("n", "sh", "<C-w>t<C-w>K")

-- other
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "<leader><CR>", ":nohls<CR>") -- replace in 'plugins/nvim-notify.lua'
keymap("n", "cc", "<CMD>write<CR><CMD>:!c %<CR><CR>")
vim.api.nvim_create_autocmd({ "TermEnter" }, { -- quit terminal mode
	pattern = { "*" },
	group = group,
	callback = function()
		local filetype = vim.bo.filetype
		if filetype == "" then
			keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
			keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
			keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
			keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
			keymap("t", "<Esc>", "<C-\\><C-n>")
		else
			keymap("t", "<C-h>", "<C-h>")
			keymap("t", "<C-j>", "<C-j>")
			keymap("t", "<C-k>", "<C-k>")
			keymap("t", "<C-l>", "<C-l>")
			keymap("t", "<Esc>", "<Esc>")
		end
	end,
})
keymap("n", "Q", ":wqa<CR>")

-- open pdf
keymap("n", "gz", function()
	local pdf_path = vim.fn.expand("<cfile>")
	vim.fn.system("zathura " .. pdf_path .. " &")
end)
