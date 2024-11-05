return {
 "nvim-telescope/telescope.nvim",
 branch = "0.1.x",
 dependencies = { "nvim-lua/plenary.nvim" },
 cmd = "Telescope",
 config = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  require("telescope").setup({
   path_display = { "smart" },
   defaults = {
    mappings = {
     i = {
      ["<C-k>"] = actions.move_selection_previous, -- move to prev result
      ["<C-j>"] = actions.move_selection_next,     -- move to next result
      ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
     },
    },
   },
  })

  local extensions = { "fzf", "symbols", "remote-sshfs" }

  for k, v in ipairs(extensions) do
   pcall(require("telescope").load_extension, v)
  end
 end,
}
