local status_ok, notify = pcall(require, "notify")
if not status_ok then
  return
end

vim.notify = notify

-- Clear notification
vim.keymap.set("n", "<leader><leader>c", ":lua require('notify').dismiss()<cr>",  { desc = '[C]lear Notifications' })
vim.keymap.set("v", "<leader><leader>c", ":<BS><BS><BS><BS><BS>lua require('notify').dismiss()<cr>gv",  { desc = '[C]lear Notifications' })
function ClearNotifications()
  require('notify').dismiss()
end
