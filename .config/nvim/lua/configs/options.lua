local options = {
	-- ui
	number = true,
	relativenumber = true,
	termguicolors = true,
	colorcolumn = "128",
	signcolumn = "yes:1",
	cmdheight = 1,
	completeopt = "menuone,noinsert,noselect",
	cursorline = false,
	list = false, -- show non-printable char
	conceallevel = 1,

	-- edit
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = 4,
	autoindent = true,
	smartindent = true,
	cindent = true,
	wrap = false,
	encoding = "utf-8",
	scrolloff = 8,

	-- case
	ignorecase = true,
	smartcase = true,

	-- undo
	undofile = true,
	undodir = vim.loop.os_homedir() .. "/.cache/nvim/undo",

	-- other
	history = 50,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- behaviour
vim.opt.iskeyword:append("-")
vim.opt.mouse:append("a")
vim.opt.clipboard:append("unnamedplus")

-- globals
vim.g.maplocalleader = " "
vim.g.mapleader = " "
