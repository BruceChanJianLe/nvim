-- function ColorMyPencils(color) 
-- 	color = color or "rose-pine"
-- 	vim.cmd.colorscheme(color)
-- 
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- 
-- end
-- 
-- ColorMyPencils()

-- All builtin colorschemes can be accessed with |:colorscheme|.
vim.cmd('colorscheme base16-gruvbox-dark-hard')
