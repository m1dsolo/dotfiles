local keymap = require("utils").keymap

return {
	"mfussenegger/nvim-dap",
	ft = { "c", "cpp", "python", "lua", "go" },
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-neotest/nvim-nio",
		{
			"folke/neodev.nvim",
			opts = {
				libary = {
					plugins = { "nvim-dap-ui" },
					types = true,
				},
			},
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		keymap("n", "<leader>dd", dapui.toggle)
		keymap("n", "<leader>db", dap.toggle_breakpoint)
		keymap("n", "<leader>dc", dap.continue)
		keymap("n", "<leader>ds", dap.step_over)
		keymap("n", "<leader>di", dap.step_into)
		keymap("n", "<leader>do", dap.step_out)
		keymap("n", "<leader>dr", dap.repl.toggle)

		dapui.setup()

		-- dap.adapters.gdb = {
		-- 	type = "executable",
		-- 	command = "lldb",
		-- 	name = "lldb",
		-- }
		-- dap.configurations.c = {
		-- 	{
		-- 		name = "Launch",
		-- 		type = "lldb",
		-- 		request = "launch",
		-- 		program = function()
		-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		-- 		end,
		-- 		cwd = "${workspaceFolder}",
		-- 		stopAtBeginningOfMainSubprogram = false,
		-- 	},
		-- }
		-- dap.configurations.cpp = dap.configurations.c

		-- auto open and close windows
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
