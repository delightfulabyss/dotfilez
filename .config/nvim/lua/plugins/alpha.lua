return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- local curl = require("plenary.curl")
		-- local response = curl.request({ url = "https://stoicquotesapi.com/v1/api/quotes/random", method = "get" })
		-- if response == nil then			dashboard.section.footer.val = nil
		-- end local J = response.body
		-- local L = "return " .. J:gsub('("[^"]-"):', "[%1]=")
		-- local T = loadstring(L)()
		-- local quote = '"' .. T.body .. '"'
		-- local author = " " .. T.author
		dashboard.section.header.val = {
			[[                                                 ]],
			[[                                                 ]],
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
			[[                                                 ]],
			[[                                                 ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("n", "💭  Quick Note", ":e $HOME/Documents/sync/notes/QuickNote.md<CR>"),
			dashboard.button("f", "🔍  Find file", ":Telescope find_files hidden=true no_ignore=false<CR>"),
			dashboard.button("r", "📅  Open recent file", ":Telescope oldfiles<CR>"),
			dashboard.button("t", "📜  Find text", ":Telescope live_grep<CR>"),
			dashboard.button("c", "⚙️  Open config", ":e $MYVIMRC<CR>"),
			dashboard.button("s", "📡 Sync Plugins", ":Lazy sync<CR>"),
			dashboard.button("q", "💀 Quit Neovim", ":qa!<CR>"),
		}
		-- dashboard.section.footer.val = quote .. author

		dashboard.config.opts.noautocmd = true
		vim.cmd([[autocmd User AlphaReady echo 'ready']])
		alpha.setup(dashboard.config)
	end,
}
