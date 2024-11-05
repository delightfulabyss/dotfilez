-- import main settings & plugins
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("delightfulabyss.core")
require("delightfulabyss.lazy")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
