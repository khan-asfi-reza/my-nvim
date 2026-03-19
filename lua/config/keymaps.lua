-- Grep search on root directory instead of cwd
vim.keymap.set("n", "<leader>/", function()
  Snacks.picker.grep({ root = LazyVim.root() })
end, { desc = "Grep (root)" })
-- Terminal on current directory
vim.keymap.set("n", "<leader>fT", function()
  Snacks.terminal()
end, { desc = "Terminal" })
-- Terminal on root directory
vim.keymap.set("n", "<leader>ft", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })

-- Terminal turn off basedpyright
vim.keymap.set("n", "<leader>=", function()
  local clients = vim.lsp.get_clients({ name = "basedpyright" })
  if #clients > 0 then
    vim.lsp.stop_client(clients)
    vim.notify("basedpyright stopped")
  else
    vim.cmd("LspStart basedpyright")
    vim.notify("basedpyright started")
  end
end, { desc = "Toggle basedpyright" })
