local colors = require("tokyonight.colors").setup()
return {
	"LeonHeidelbach/trailblazer.nvim",
	config = function()
		require("trailblazer").setup({
			lang = "en",
			auto_save_trailblazer_state_on_exit = true,
			auto_load_trailblazer_state_on_enter = false, -- experimental
			custom_session_storage_dir = "~/trail_blazer_sessions", -- i.e. "~/trail_blazer_sessions/"
			trail_options = {
				available_trail_mark_modes = {
					"global_chron",
					"global_buf_line_sorted",
					"global_chron_buf_line_sorted",
					"global_chron_buf_switch_group_chron",
					"global_chron_buf_switch_group_line_sorted",
					"buffer_local_chron",
					"buffer_local_line_sorted",
				},
				current_trail_mark_mode = "global_chron",
				current_trail_mark_list_type = "quickfix", -- currently only quickfix lists are supported
				verbose_trail_mark_select = true, -- print current mode notification on mode change
				mark_symbol = "*", --  will only be used if trail_mark_symbol_line_indicators_enabled = true
				newest_mark_symbol = "", -- disable this mark symbol by setting its value to ""
				cursor_mark_symbol = "", -- disable this mark symbol by setting its value to ""
				next_mark_symbol = "", -- disable this mark symbol by setting its value to ""
				previous_mark_symbol = "", -- disable this mark symbol by setting its value to ""
				multiple_mark_symbol_counters_enabled = true,
				number_line_color_enabled = true,
				trail_mark_in_text_highlights_enabled = true,
				trail_mark_symbol_line_indicators_enabled = true, -- show indicators for all trail marks in symbol column
				symbol_line_enabled = true,
				default_trail_mark_stacks = {
					"default",
					"tests",
				},
				available_trail_mark_stack_sort_modes = {
					"alpha_asc", -- alphabetical ascending
					"alpha_dsc", -- alphabetical descending
					"chron_asc", -- chronological ascending
					"chron_dsc", -- chronological descending
				},
				current_trail_mark_stack_sort_mode = "alpha_asc",
			},
			event_list = {
				"TrailBlazerTrailMarkStackSaved",
				"TrailBlazerTrailMarkStackDeleted",
				"TrailBlazerCurrentTrailMarkStackChanged",
				"TrailBlazerTrailMarkStackSortModeChanged",
			},
			force_mappings = {},
			hl_groups = {
				TrailBlazerTrailMark = {
					-- You can add any valid highlight group attribute to this table
					guifg = "White",
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkNext = {
					guifg = colors.blue1,
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkPrevious = {
					guifg = colors.blue1,
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkCursor = {
					guifg = colors.purple,
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkNewest = {
					guifg = colors.orange,
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkGlobalChron = {
					guifg = colors.magenta2,
					guibg = "none",
					gui = "bold",
				},
				TrailBlazerTrailMarkGlobalBufLineSorted = {
					guifg = "Black",
					guibg = "LightRed",
					gui = "bold",
				},
				TrailBlazerTrailMarkGlobalChronBufLineSorted = {
					guifg = "Black",
					guibg = "Olive",
					gui = "bold",
				},
				TrailBlazerTrailMarkGlobalChronBufSwitchGroupChron = {
					guifg = "Black",
					guibg = "VioletRed",
					gui = "bold",
				},
				TrailBlazerTrailMarkGlobalChronBufSwitchGroupLineSorted = {
					guifg = "Black",
					guibg = "MediumSpringGreen",
					gui = "bold",
				},
				TrailBlazerTrailMarkBufferLocalChron = {
					guifg = "Black",
					guibg = "Green",
					gui = "bold",
				},
				TrailBlazerTrailMarkBufferLocalLineSorted = {
					guifg = "Black",
					guibg = "LightGreen",
					gui = "bold",
				},
			},
		})
	end,
}
