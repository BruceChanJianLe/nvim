-- Plan to move to set.lua
vim.opt.list = true
vim.opt.listchars = {
  trail = "·",
  -- space = "·",
  tab = "→ ",
  eol= "¶"
}

vim.keymap.set("n", "<leader>ti", function()
  vim.opt.list = not vim.opt.list:get()
end, { desc = "[T]oggle [I]nvisible Characters" })

return {
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   ---@module "ibl"
  --   ---@type ibl.config
  --   opts = {},
  -- }
}
