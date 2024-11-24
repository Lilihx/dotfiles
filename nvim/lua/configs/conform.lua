local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    go = { "gofmt", "goimports-reviser", "goimports", "golines" },
    rust = { "rustfmt" },
    python = { "black", "isort" },
    sql = { "sql-formatter" },
    markdown = { "markdownlint" },
    sh = { "shfmt" },
    css = { "prettier" },
    html = { "prettier" },
  },
  formatters = {
    black = {
      prepend_args = { "--fast" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
