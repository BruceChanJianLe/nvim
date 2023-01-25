-- All builtin colorschemes can be accessed with |:colorscheme|.
function ColorMyPencils(color)
	color = color or "base16-gruvbox-dark-hard"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

vim.keymap.set("n", "<leader>c", ":lua ColorMyPencils()<CR>")

ColorMyPencils()
-- vim.cmd('colorscheme base16-gruvbox-dark-hard')
