-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Trailblazer events
local trailblazer_group = vim.api.nvim_create_augroup("TrailBlazer", { clear = true })

vim.api.nvim_create_autocmd("User", {
	pattern = "TrailBlazerTrailMarkStackSaved",
	callback = function(event)
		vim.api.nvim_echo({ { event.data.added_stack .. " added to stack list", "Normal" } }, true, {})
	end,
	group = trailblazer_group,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TrailBlazerTrailMarkStackDeleted",
	callback = function(event)
		vim.api.nvim_echo({ { event.data.deleted_stacks[1] .. " deleted from stack list", "Normal" } }, true, {})
	end,
	group = trailblazer_group,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TrailBlazerTrailMarkStackChanged",
	callback = function(event)
		vim.api.nvim_echo({ { "Switched to stack " .. event.data.current_stack, "Normal" } }, true, {})
	end,
	group = trailblazer_group,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "TrailBlazerTrailMarkSortModeChanged",
	callback = function(event)
		vim.api.nvim_echo({ { "Switched to sort mode " .. event.data.current_sort_mode, "Normal" } }, true, {})
	end,
	group = trailblazer_group,
})
