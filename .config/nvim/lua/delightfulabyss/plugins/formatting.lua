return {
 "stevearc/conform.nvim",
 event = { "BufReadPre", "BufNewFile" },
 config = function()
  local conform = require("conform")

  conform.setup({
   formatters_by_ft = {
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    css = { "prettierd" },
    html = { "prettierd" },
    json = { "prettierd" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
    lua = { "stylua" },
    rust = { "rustfmt" },
    python = { "ruff", "black" },
   },
   format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
   },
  })
 end,
}
