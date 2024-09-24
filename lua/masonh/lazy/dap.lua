return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"williamboman/mason.nvim",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		require("dapui").setup()
		dap.adapters.codelldb = {
			type = "server",
			port = 13000,
			executable = {
				command = "/Users/masonhall/.local/share/nvim/mason/bin/codelldb",
				args = { "--port", 13000 },
			},
		}
		dap.configurations.c = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
			},
		}
		dap.configurations.cpp = dap.configurations.c
		dap.configurations.rust = dap.configurations.c
		vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

		vim.keymap.set("n", "<space>?", function()
			dapui.eval(nil, { enter = true })
		end)

		vim.keymap.set("n", "<F1>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_into)
		vim.keymap.set("n", "<F11>", dap.step_over)
		vim.keymap.set("n", "<F12>", dap.restart)

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
