return {
  "Exafunction/windsurf.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.cmp",
  },
  event = "BufEnter",
  config = function()
    require("codeium").setup({
      enable_cmp_source = false,
      config_path = vim.fn.stdpath("data") .. "/codeium.json",
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = "<S-Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          clear = "<C-]>",
        },
      },
    })
  end,
}
