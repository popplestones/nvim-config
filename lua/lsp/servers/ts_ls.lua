-- lua/lsp/servers/ts_ls.lua
return {
  typescript = {
    tsdk = vim.fn.expand("~/.npm-global/lib/node_modules/typescript/lib"),
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand("~/.npm-global/lib/node_modules/@vue/typescript-plugin"),
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = { "javascript", "typescript", "vue" },
}
