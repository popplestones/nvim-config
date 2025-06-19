local M = {}

M.refresh_lsp_workspace = function()
  for _, client in pairs(vim.lsp.get_clients()) do
    if client.server_capabilities.workspace and client.server_capabilities.workspace.didChangeWatchedFiles then
      client.notify("workspace/didChangeWatchedFiles", {
        changes = {
          {
            uri = "file://" .. vim.fn.getcwd(),
            type = 2,
          },
        },
      })
    end
  end
end

return M
