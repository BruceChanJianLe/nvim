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
  { 'tpope/vim-surround' },
  { 'wellle/targets.vim' },


  -- Use by tmux resurrect
  {
    'tpope/vim-obsession',
    dependencies = { 'tpope/vim-repeat' }
  },

}
