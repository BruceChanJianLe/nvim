-- -- For dark theme (neovim's default)
vim.o.background = 'dark' -- 'dark' or 'light'

local status_ok, vscode_theme = pcall(require, "vscode")
if not status_ok then
  return
end

vscode_theme.setup({
    -- Alternatively set style in setup
    -- style = 'light'

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = false,

})
vscode_theme.load()

-- All builtin colorschemes can be accessed with |:colorscheme|.
function ColorMyPencils(color)
  -- color = color or "base16-gruvbox-dark-pale" -- Keep for reference
  color = color or "vscode"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.o.guicursor = 

end

vim.keymap.set("n", "<leader>c", "<cmd>lua ColorMyPencils()<CR>")

ColorMyPencils()
-- vim.cmd('colorscheme base16-gruvbox-dark-hard')
