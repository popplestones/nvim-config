return {
  "echasnovski/mini.tabline",
  event = "VeryLazy",
  opts = {
    show_icons = true,
    set_vim_settings = false,
    tabpage_section = "right",
  },
  keys = {
    { "<leader>bp", "<cmd>bprevious<cr>", desc = "Prev Buffer" },
    { "<leader>bn", "<cmd>bnext<cr>", desc = "Next Buffer" },
    { "<leader>bd", "<cmd>bdelete<cr>", desc = "Delete Buffer" },
    { "<leader>bD", "<cmd>bdelete!<cr>", desc = "Delete Buffer (Force)" },
  },
}