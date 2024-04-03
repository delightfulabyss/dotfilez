return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	lazy = false,  -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},  -- Loads default behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.dirman"] = {
					config = {
						workspaces = {
							personal = "~/Documents/Sync/notes/personal",
							work = "~/Documents/Sync/notes/work",
						},
					},
				}, -- Manages Neorg workspaces
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		})
	end,
}
