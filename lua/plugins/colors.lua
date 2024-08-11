-- color setup

function ColorMyPencils(color)
  -- -- For dark theme (neovim's default)
  vim.o.background = 'dark' -- 'dark' or 'light'

  -- color = color or "base16-gruvbox-dark-pale" -- Keep for reference
  color = color or 'vscode'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.o.guicursor =
end

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    opts = {
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = false,
    },
    config  = function()
      ColorMyPencils()
    end
  },
  { 'RRethy/nvim-base16', }
}
