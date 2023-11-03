local status_ok, git_worktree = pcall(require, "git-worktree")
if not status_ok then
  return
end

git_worktree.setup()

vim.keymap.set({'n', 'v'}, "<leader>ws", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", { desc = 'git [W]orktree [S]witch' })
vim.keymap.set({'n', 'v'}, "<leader>wc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", { desc = 'git [W]orktree [C]reate' })
