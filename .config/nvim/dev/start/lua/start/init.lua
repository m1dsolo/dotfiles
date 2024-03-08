local M = {}

function M.setup(opts)
	opts = opts or {}

	local group = vim.api.nvim_create_augroup("start", { clear = true })

	-- all
	-- vim.cmd(":NvimTreeOpen")
	-- vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>l", true, false, true), "m", true)

	-- remember last position
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		desc = "return cursor to where it was last time closing the file",
		pattern = "*",
		command = 'silent! normal! g`"zv',
		group = group,
	})

	-- highlight yank
	vim.api.nvim_create_autocmd({ "TextYankPost" }, {
		desc = "highlight yank",
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ timeout = 500 })
		end,
		group = group,
	})

	-- auto formatting on save
	vim.api.nvim_create_autocmd("BufWritePost", {
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm", async = false })
		end,
		group = group,
	})

	-- auto close fcitx5
	vim.api.nvim_create_autocmd({ "InsertEnter" }, {
		pattern = "*",
		group = group,
		callback = function()
			local input_status = vim.fn.system("fcitx5-remote") -- {1: English, 2: Chinese}
			if input_status:sub(1, 1) ~= "2" and vim.g.input_toggle == 1 then
				vim.fn.system("fcitx5-remote -o")
				vim.g.input_toggle = 0
			end
		end,
	})
	vim.api.nvim_create_autocmd({ "InsertLeave" }, {
		pattern = "*",
		group = group,
		callback = function()
			local input_status = vim.fn.system("fcitx5-remote")
			if input_status:sub(1, 1) == "2" then
				vim.g.input_toggle = 1
				vim.fn.system("fcitx5-remote -c")
			end
		end,
	})

	-- what
	-- vim.api.nvim_create_user_command("BufferDelete", function()
	-- 	---@diagnostic disable-next-line: missing-parameter
	-- 	local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
	-- 	local modified = vim.api.nvim_buf_get_option(0, "modified")
	-- 	if file_exists == 0 and modified then
	-- 		local user_choice =
	-- 			vim.fn.input("The file is not saved, whether to force delete? Press enter or input [y/n]:")
	-- 		if user_choice == "y" or string.len(user_choice) == 0 then
	-- 			vim.cmd("bd!")
	-- 		end
	-- 		return
	-- 	end
	-- 	local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"
	-- 	vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
	-- end, { desc = "Delete the current Buffer while maintaining the window layout" })

	-- cpp
	vim.api.nvim_create_autocmd({ "BufNewFile" }, {
		pattern = { "*.cpp" },
		callback = function()
			local lines = {
				"#include <iostream>",
				"#include <algorithm>",
				"#include <cstring>",
				"",
				"using namespace std;",
				"using LL = long long;",
				"using PII = pair<int, int>;",
				"",
				"int main() {",
				"\t",
				"\t",
				"\treturn 0;",
				"}",
			}
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
			vim.api.nvim_win_set_cursor(0, { 10, 4 })
			-- vim.cmd("startinsert")
		end,
		group = group,
	})
	vim.api.nvim_create_autocmd({ "BufEnter" }, {
		pattern = { "*.cpp" },
		callback = function()
			-- auto open data file
			vim.keymap.set("n", "<leader>d", function()
				local exists = false
				for _, win in ipairs(vim.fn.getwininfo()) do
					local name = vim.api.nvim_buf_get_name(win.bufnr)
					if name:match("(.cache/data)$") then
						exists = true
						vim.cmd("write ~/.cache/data")
						vim.api.nvim_win_close(win.winid, true)
						break
					end
				end

				if not exists then
					vim.cmd("botright vsplit ~/.cache/data")
				end
			end, { noremap = true, silent = true })
		end,
		group = group,
	})

	-- bash
	vim.api.nvim_create_autocmd({ "BufNewFile" }, {
		pattern = { "*.sh" },
		callback = function()
			local lines = {
				"#!/bin/bash",
				"",
				"",
			}
			vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
			vim.api.nvim_win_set_cursor(0, { 3, 0 })
		end,
		group = group,
	})
end

return M
