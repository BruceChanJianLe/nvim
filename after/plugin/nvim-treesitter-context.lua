local status_ok, tc = pcall(require, "treesitter-context")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "MatchParen"})
vim.keymap.set({"n", "v"}, "<leader>tc", "<cmd> TSContextToggle<CR>", { desc = "[T]oggle Treesitter [C]ontext"})
