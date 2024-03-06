return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {},
			},
		})

		local extensions = { "fzf", "http", "software-license", "media_files", "symbols", "remote-sshfs" }

		for k, v in ipairs(extensions) do
			pcall(require("telescope").load_extension, v)
		end
	end,
}
