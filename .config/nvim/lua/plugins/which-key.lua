return {
	"folke/which-key.nvim",
	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.setup({
			plugins = {
				marks = false,     -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				spelling = {
					enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				presets = {
					operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
					motions = true,      -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true,      -- default bindings on <c-w>
					nav = true,          -- misc bindings to work with windows
					z = true,            -- bindings for folds, spelling and others prefixed with z
					g = true,            -- bindings for prefixed with g
				},
			},
			-- add operators that will trigger motion and text object completion
			-- to enable all native operators, set the preset / operators plugin above
			operators = { gc = "Comments" },
			key_labels = {
				-- override the label used to display some keys. It doesn't effect WK in any other way.
				-- For example:
				-- ["<space>"] = "SPC",
				-- ["<cr>"] = "RET",
				-- ["<tab>"] = "TAB",
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "➜", -- symbol used between a key and it's label
				group = "+", -- symbol prepended to a group
			},
			popup_mappings = {
				scroll_down = "<c-d>", -- binding to scroll down inside the popup
				scroll_up = "<c-u>",   -- binding to scroll up inside the popup
			},
			window = {
				border = "none",          -- none, single, double, shadow
				position = "bottom",      -- bottom, top
				margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
				padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
				winblend = 0,
			},
			layout = {
				height = { min = 4, max = 25 },                                              -- min and max height of the columns
				width = { min = 20, max = 50 },                                              -- min and max width of the columns
				spacing = 3,                                                                 -- spacing between columns
				align = "left",                                                              -- align columns left, center or right
			},
			ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
			hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
			show_help = true,                                                             -- show help message on the command line when the popup is visible
			show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
			triggers = "auto",                                                            -- automatically setup triggers
			-- triggers = {"<leader>"} -- or specify a list manually
			triggers_blacklist = {
				-- list of mode / prefixes that should never be hooked by WhichKey
				-- this is mostly relevant for key maps that start with a native binding
				-- most people should not need to change this
				i = { "j", "k" },
				v = { "j", "k" },
			},
			-- disable the WhichKey popup for certain buf types and file types.
			-- Disabled by deafult for Telescope
			disable = {
				buftypes = {},
				filetypes = { "TelescopePrompt" },
			},
		})
		wk.register({
			["<leader>"] = { require("telescope.builtin").buffers, "Find Existing Buffers" },
			["/"] = {
				function()
					require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
						winblend = 10,
						previewer = true,
					}))
				end,
				"Fuzzy Search in Current Buffer",
			},
			s = {
				name = "Search",
				f = {
					function()
						require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
					end,
					"All Files in CWD",
				},
				r = { require("telescope.builtin").oldfiles, "Recent Files" },
				h = { require("telescope.builtin").help_tags, "Help Tags" },
				w = { require("telescope.builtin").grep_string, "Current Word" },
				g = { require("telescope.builtin").live_grep, "Live Grep" },
				d = { require("telescope.builtin").diagnostics, "Diagnostics" },
				F = { require("telescope.builtin").git_files, "Git-Tracked Files" },
				c = { require("telescope.builtin").git_commits, "Git Commits" },
				b = { require("telescope.builtin").git_branches, "Git Branches" },
				s = { require("telescope.builtin").git_stash, "Git Stashes" },
				H = { require("telescope").extensions.http.list, "HTTP Codes" },
				l = { "<cmd>Telescope software-licenses find<CR>", "Software Licenses" },
				m = { require("telescope").extensions.media_files.media_files, "Media Files" },
				k = { require("telescope.builtin").keymaps, "Keymaps" },
			},
			b = {
				name = "Buffers",
				c = { "<cmd>bd!<CR>", "Close Buffer" },
				C = { "<cmd>%bd | e# | bd#<CR>", "Close All Other Buffers" },
				s = {
					function()
						vim.api.nvim_command("botright vs")
						vim.api.nvim_command("enew")
						vim.api.nvim_command("file Scratch")
						vim.api.nvim_command("setlocal buftype=nofile")
						vim.api.nvim_command("setlocal bufhidden=wipe")
						vim.api.nvim_command("setlocal noswapfile")
					end,
					"Scratch Buffer",
				},
			},
			g = {
				name = "Git",
				b = { "<cmd>Gitsigns blame_line<CR>", "Blame" },
				d = { "<cmd>Gvdiffsplit!<CR>", "View Diff" },
				l = { "<cmd>Git log<CR>", "View Log" },
				m = { "<cmd>GMove ", "Move" },
				M = { "<cmd>Git mergetool<CR>", "Merge" },
				r = { "<cmd>Gread<CR>", "Gread" },
				w = { "<cmd>Gwrite<CR>", "Gwrite" },
				x = { "<cmd>GRemove<CR>", "Remove" },
				t = { "<cmd>Gitsigns toggle_signs<CR>", "Toggle Signs" },
				n = { "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
				p = { "<cmd>Gitsigns previous_hunk<CR>", "Previous Hunk" },
				s = { "<cmd>Gitsigns stage_hunk<CR>", "Stage Hunk" },
				u = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Unstage Hunk" },
			},
			m = {
				name = "Marks",
				a = { "<cmd>TrailBlazerNewTrailMark<CR>", "Add Mark" },
				A = {
					function()
						local stack_name = vim.fn.input("New Stack Name: ")
						require("trailblazer").add_trail_mark_stack(stack_name)
					end,
					"Add Mark Stack",
				},
				b = { require("trailblazer").track_back, "Track Back" },
				p = { require("trailblazer").peek_move_previous_up, "Previous Mark" },
				n = { require("trailblazer").peek_move_next_down, "Next Mark" },
				N = { require("trailblazer").move_to_nearest, "Move to Nearest Mark" },
				t = { require("trailblazer").toggle_trail_mark_list, "Toggle Mark List" },
				l = { "<cmd>TrailBlazerLoadSession<CR>", "Load Session" },
				d = { require("trailblazer").delete_all_trail_marks, "Delete All Marks" },
				D = {
					function()
						local stack_name = vim.fn.input("Stack To Delete: ")
						require("trailblazer").delete_trail_mark_stack(stack_name)
					end,
					"Delete Mark Stack",
				},
				c = { require("trailblazer").move_to_trail_mark_cursor, "Move to Trail Mark Cursor" },
				v = { require("trailblazer").paste_at_last_trail_mark, "Past at Last Trail Mark" },
				V = { require("trailblazer").paste_at_all_trail_marks, "Past at All Trail Marks" },
				s = { require("trailblazer").set_trail_mark_stack_select_mode, "Change Selection Mode" },
				S = {
					function()
						local stack_name = vim.fn.input("Stack To Switch To: ")
						require("trailblazer").switch_trail_mark_stack(stack_name)
					end,
					"Switch Trail Mark Stack",
				},
				h = { "<cmd>TrailBlazerSetTrailMarkStackSortMode<CR>", "Change Stack Sort Mode" },
				z = {
					"<cmd>TrailBlazerSaveSession<CR>",
					"Save Session",
				},
			},
			d = {
				name = "Debugger",
				c = {
					function()
						require("dap").continue()
					end,
					"Continue",
				},
				o = {
					function()
						require("dap").step_over()
					end,
					"Step Over",
				},
				i = {
					function()
						require("dap").step_into()
					end,
					"Step Into",
				},
				O = {
					function()
						require("dap").step_out()
					end,
					"Step Out",
				},
				b = {
					function()
						require("dap").toggle_breakpoint()
					end,
					"Toggle Breakpoint",
				},
				B = {
					function()
						require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					"Set Conditional Breakpoint",
				},
				L = {
					function()
						require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
					end,
					"Set Log Point",
				},
				r = {
					function()
						require("dap").repl.open()
					end,
					"Open REPL",
				},
				L = {
					function()
						require("dap").run_last()
					end,
					"Run Last Debug Adapter",
				},
				t = {
					function()
						require("dapui").toggle()
					end,
					"Toggle UI",
				},
				R = {
					function()
						require("dap").restart()
					end,
					"Restart Session",
				},
				l = {
					function()
						require("dap").list_breakpoints()
					end,
					"List Breakpoints",
				},
				C = {
					function()
						require("dap").clear_breakpoints()
					end,
					"Clear Breakpoints",
				},
				T = {
					function()
						require("dap").terminate()
					end,
					"Terminate Session",
				},
			},
		}, { prefix = "<leader>" })
		wk.register({
			d = {
				p = {
					vim.diagnostic.goto_prev,
					"Previous Diagnostic",
				},
				n = {
					vim.diagnostic.goto_next,
					"Next Diagnostic",
				},
				o = {
					vim.diagnostic.open_float,
					"Open Diagnostic in Floating Window",
				},
			},
		})
		wk.register({
			z = { "<cmd>ZenMode<CR>", "Zen Mode" },
			a = {
				name = "ChatGPT",
				p = { "<cmd>ChatGPT<CR>", "Prompt" },
				a = { "<cmd>ChatGPTActAs<CR>", "Act As" },
				e = { "<cmd>ChatGPTEditWithInstructions<CR>", "Edit With Instructions" },
			},
			e = { "<cmd>Oil<CR>", "File Explorer" },
			w = {
				name = "Windows",
				h = { "<C-w>h", "Left" },
				j = { "<C-w>j", "Down" },
				k = { "<C-w>k", "Up" },
				l = { "<C-w>l", "Right" },
				v = { "<C-w>v<C-w>l", "Vertical Split" },
				s = { "<C-w>s<C-w>j", "Horizontal Split" },
				r = { "<C-w>r", "Rotate Clockwise" },
				R = { "<C-w>R", "Rotate Counter Clockwise" },
				x = { "<C-w>x", "Swap" },
				X = { "<C-w>X", "Reverse Swap" },
				H = { "<C-w>H", "Move Window Left" },
				J = { "<C-w>J", "Move Window Down" },
				K = { "<C-w>K", "Move Window Up" },
				L = { "<C-w>L", "Move Window Right" },
				e = { "<C-w>=", "Make all equal size" },
				[">"] = { "<C-w>>", "Increase Window Width" },
				["<"] = { "<C-w><", "Decrease Window Width" },
				["+"] = { "<C-w>+", "Increase Window Height" },
				["-"] = { "<C-w>-", "Decrease Window Height" },
				["]"] = { "<C-w>]", "Open Tag in New Window" },
				["}"] = { "<C-w>}", "Preview Tag in New Window" },
			},
		}, { mode = { "n", "v" }, prefix = "<leader>" })
		wk.register({
			["<C-h>"] = { "<cmd>ZellijNavigateLeft<CR>", "Zellij Left" },
			["<C-j>"] = { "<cmd>ZellijNavigateDown<CR>", "Zellij Down" },
			["<C-k>"] = { "<cmd>ZellijNavigateUp<CR>", "Zellij Up" },
			["<C-l>"] = { "<cmd>ZellijNavigateRight<CR>", "Zellij Right" },
		}, { mode = { "n", "t" } })
	end,
}
