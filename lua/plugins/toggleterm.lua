return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    {
      "<leader>tt",
      "<cmd>ToggleTerm<CR>",
      desc = "[T]oggle floating [T]erminal",
      mode = "n",
    },
  },
  config = function()
    require("toggleterm").setup({
      direction = "float",
      float_opts = {
        border = "curved",
      },
    })
  end,
}
