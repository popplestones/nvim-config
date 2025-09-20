return {
  init_options = {
    licenceKey = vim.env.INTELEPHENSE_LICENSE_KEY,
  },
  settings = {
    intelephense = {
      diagnostics = {
        unusedSymbols = true,
      },
    },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
      -- Filter out unused symbol diagnostics for variables starting with underscore
      if result and result.diagnostics then
        result.diagnostics = vim.tbl_filter(function(diagnostic)
          local message = diagnostic.message or ""
          return not message:match("Symbol '%$_[^']*' is declared but not used%.")
        end, result.diagnostics)
      end
      vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
    end,
  },
}
