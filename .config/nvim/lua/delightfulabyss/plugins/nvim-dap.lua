return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"mxsdev/nvim-dap-vscode-js",
		"mfussenegger/nvim-dap-python",
	},
	config = function()
		-- setup adapters
		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
			debugger_cmd = { "js-debug-adapter" },
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})
		local path = vim.fn.stdpath("data") .. "mason/packages/depugpy/venv/bin/python"
		require("dap-python").setup(path)

		local dap = require("dap")

		-- custom adapter for running tasks before starting debug
		-- local custom_adapter = "pwa-node-custom"
		-- dap.adapters[custom_adapter] = function(cb, config)
		-- 	if config.preLaunchTask then
		-- 		local async = require("plenary.async")
		-- 		local notify = require("notify").async
		--
		-- 		async.run(function()
		-- 			---@diagnostic disable-next-line: missing-parameter
		-- 			notify("Running [" .. config.preLaunchTask .. "]").events.close()
		-- 		end, function()
		-- 			vim.fn.system(config.preLaunchTask)
		-- 			config.type = "pwa-node"
		-- 			dap.run(config)
		-- 		end)
		-- 	end
		-- end
		--
		dap.adapters.bashdb = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/bash-debug-adapter",
			name = "bashdb",
		}
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
			name = "lldb",
		}

		local js_exts = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
		-- language config
		for _, language in ipairs(js_exts) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file in new node process",
					cwd = vim.fn.getcwd(),
					program = "${file}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach debugger to exisiting `node --inspect` process",
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"node_modules/**",
					},
					cwd = vim.fn.getcwd(),
					processId = require("dap.utils").pick_process,
					skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file in new node process (pwa-node with ts-node)",
					cwd = vim.fn.getcwd(),
					runtimeArgs = { "--loader", "ts-node/esm" },
					runtimeExecutable = "node",
					args = { "${file}" },
					sourceMaps = true,
					protocol = "inspector",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch Test Current File (pwa-node with jest)",
					cwd = vim.fn.getcwd(),
					runtimeArgs = { "${workspaceFolder}/node_modules/.bin/jest" },
					runtimeExecutable = "node",
					args = { "${file}", "--coverage", "false" },
					rootPath = "${workspaceFolder}",
					sourceMaps = true,
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Launch chrome to debug client-side code",
					url = "http://localhost:3000",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					webRoot = "${workspaceFolder}/src",
					protocol = "inspector",
					port = 9222,
					skipFiles = { "<node_internals>/**", "node_modules/**" },
				},
			}
			dap.configurations.sh = {
				{
					type = "bashdb",
					request = "launch",
					name = "Launch file",
					showDebugOutput = true,
					pathBashdb = vim.fn.stdpath("data")
						.. "/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb",
					pathBashdbLib = vim.fn.stdpath("data") .. "/mason/packages/bash-debug-adapter/extension/bashdb_dir",
					trace = true,
					file = "${file}",
					program = "${file}",
					cwd = "${workspaceFolder}",
					pathCat = "cat",
					pathBash = "/bin/bash",
					pathMkfifo = "mkfifo",
					pathPkill = "pkill",
					args = {},
					env = {},
					terminalKind = "integrated",
				},
			}
			dap.configurations.rust = {
				{
					name = "Launch",
					type = "lldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
					-- 💀
					-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
					--
					--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
					--
					-- Otherwise you might get the following error:
					--
					--    Error on launch: Failed to attach to the target process
					--
					-- But you should be aware of the implications:
					-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
					-- runInTerminal = false,
				},
			}
		end
		require("nvim-dap-virtual-text").setup()
	end,
}
