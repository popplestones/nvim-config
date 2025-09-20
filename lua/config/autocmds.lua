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

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { ".env*", "*.env" },
  callback = function(args)
    vim.bo.filetype = "dotenv"
    vim.schedule(function()
      -- Disable diagnostics
      if vim.diagnostic and vim.diagnostic.disable then
        vim.diagnostic.disable(args.buf)
      end
      -- Detach bashls if it's attached
      local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "bashls" })
      for _, client in ipairs(clients) do
        vim.lsp.buf_detach_client(args.buf, client.id)
      end
    end)
  end,
})

-- Auto resize panes when resizing nvim window
vim.api.nvim_create_autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

-- Go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "grug-far",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns.blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})
