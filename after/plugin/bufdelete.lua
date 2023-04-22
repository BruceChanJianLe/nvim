local status_ok, bufdelete = pcall(require, "bufdelete")
if not status_ok then
  return
end

vim.keymap.set("n", "<leader><leader>q", "<cmd>Bdelete<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>Bdelete<CR>")
