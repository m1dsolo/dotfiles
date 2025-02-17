-- TODO: check if already have same file name image in the web
local config = require("img-clip-web.config")
local paste = require("img-clip-web.paste")

local M = {}

function M.setup(opts)
	config.default = vim.tbl_extend("force", config.default, opts)
end

function M.paste_image()
	return paste.paste_image()
end

return M
