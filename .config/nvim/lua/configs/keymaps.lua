local keymap = require("utils").keymap

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
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]])
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]])
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]])
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]])
keymap("n", "<C-h>", ":TmuxNavigateLeft<CR>")
keymap("n", "<C-j>", ":TmuxNavigateDown<CR>")
keymap("n", "<C-k>", ":TmuxNavigateUp<CR>")
keymap("n", "<C-l>", ":TmuxNavigateRight<CR>")
keymap("n", "<up>", ":res -3<CR>")
keymap("n", "<down>", ":res +3<cr>")
keymap("n", "<left>", ":vertical resize-3<CR>")
keymap("n", "<right>", ":vertical resize+3<CR>")
keymap("n", "sv", "<C-w>t<C-w>H")
keymap("n", "sh", "<C-w>t<C-w>K")

-- other
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "<leader><CR>", ":nohls<CR>")
keymap("n", "cc", "<CMD>write<CR><CMD>:!c %<CR><CR>")
keymap("t", "<Esc>", "<C-\\><C-n>")
keymap("n", "Q", ":wqa<CR>")
