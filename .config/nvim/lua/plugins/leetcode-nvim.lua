return {
	"kawre/leetcode.nvim",
	build = ":TSUpdate html",
	lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim", -- required by telescope
		"MunifTanjim/nui.nvim",

		-- optional
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-notify",
		"nvim-tree/nvim-web-devicons",
		{
			"3rd/image.nvim",
			opts = {
				backend = "ueberzug",
				max_width_window_percentage = 100,
				window_overlap_clear_enabled = true,
			},
			init = function()
				package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
				package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
			end,
		},
	},
	opts = {
		lang = "cpp",
		cn = {
			enabled = true,
		},
		console = {
			size = {
				width = "90%",
				height = "75%",
			},
			result = {
				size = "60%",
			},
			testcases = {
				virt_text = true,
				size = "40%",
			},
		},
		description = {
			position = "left",
			width = "40%",
			show_stats = true,
		},
		storage = {
			home = "~/code/cpp/leetcode",
			cache = vim.fn.stdpath("cache") .. "/leetcode",
		},
		injector = {
			["cpp"] = {
				before = {
					"#include <bits/stdc++.h>",
					"using namespace std;",

					"struct TreeNode {",
					"   int val;",
					"   TreeNode *left;",
					"   TreeNode *right;",
					"   TreeNode() : val(0), left(nullptr), right(nullptr) {}",
					"   TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}",
					"   TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}",
					"};",

					"struct ListNode {",
					"   int val;",
					"   ListNode *next;",
					"   ListNode() : val(0), next(nullptr) {}",
					"   ListNode(int x) : val(x), next(nullptr) {}",
					"   ListNode(int x, ListNode *next) : val(x), next(next) {}",
					"};",
				},
				after = "int main() {}",
			},
		},
		hooks = {
			["question_enter"] = function()
				vim.cmd("Copilot disable")
			end,
		},
		keys = {
			reset_testcases = "R",
			use_testcases = "A",
			focus_testcases = "<C-h>",
			focus_result = "<C-l>",
		},
		image_support = true,
	},
	keys = {
		{ "<leader>'", ":Leet run<cr>" },
		{ "<leader><cr>", ":Leet submit<cr>" },
		{ "<leader>o", ":Leet open<cr>" },
		{ "<leader>i", ":Leet info<cr>" },
		{ "<leader>l", ":Leet list<cr>" },
		{ "<leader>r", ":Leet reset<cr>" },
		{ "<leader>c", ":Leet console<cr>" },
	},
}
