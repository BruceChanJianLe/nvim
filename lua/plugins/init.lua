return {
  {
    'mbbill/undotree',
    opts = {},
    config = function()
      vim.g.undotree_SetFocusWhenToggle = true
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
  },

  -- Text object manipulation
  {
    'tpope/vim-surround',
    dependencies = { 'tpope/vim-repeat' },
  },
  { 'wellle/targets.vim' },
  { 'tpope/vim-obsession' },
}
