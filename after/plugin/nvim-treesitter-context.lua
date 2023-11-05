local status_ok, tc = pcall(require, "treesitter-context")
if not status_ok then
  return
end

vim.api.nvim_set_hl(0, "TreesitterContext", { link = "MatchParen"})
-- TODO enable and disable context TSContextToggle
