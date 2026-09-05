require("user.remap")
require("user.set")
require("user.lazy")

vim.o.background = 'dark'

-- Slim mode has no plugins, so no vscode colorscheme - use a built-in one
if vim.env.NVIM_SLIM then
  vim.cmd.colorscheme('habamax')
  return
end

-- setting colorscheme last
-- an issue for another day
vim.cmd.colorscheme('vscode')
-- vim.cmd('highlight link TreesitterContext PmenuSbar')
vim.api.nvim_set_hl(0, 'TreesitterContext', { link = 'PmenuSbar' })
