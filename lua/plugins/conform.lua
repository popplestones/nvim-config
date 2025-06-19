return {
  "stevearc/conform.nvim",
  opts = {
    -- Replaced this with an auto-cmd so i don't get the asking to save after formatting.
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_format = "fallback",
    -- },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      go = { "gofmt" },
      php = { "pint" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      vue = { "prettierd", "prettier", stop_after_first = true },
    },
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
    },
  },
}
