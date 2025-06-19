-- Highlight what we are yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Setup default tab size for lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.shiftwidth = 2 -- Number of spaces for each indent
    vim.bo.tabstop = 2 -- Number of spaces per tab
    vim.bo.softtabstop = 2 -- Used when deleting with backspace
    vim.bo.expandtab = true -- Use spaces instead of tabs
  end,
})

-- AutoFormat before Save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    require("conform").format({
      bufnr = args.buf,
      timeout_ms = 500,
      lsp_fallback = true,
    })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = { "*Avante*", "*.avante", "*.md" },
  callback = function()
    if vim.g.codeium_enabled then
      vim.cmd("Codeium Toggle")
    end
  end,
})
