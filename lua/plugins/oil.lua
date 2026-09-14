return {
  {
    'stevearc/oil.nvim',
    -- must load at startup to claim directory buffers (nvim <dir>)
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      default_file_explorer = true, -- use oil instead of netrw
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
      },
      win_options = {
        wrap = true,
      },
    },
    config = function(_, opts)
      require('oil').setup(opts)

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
}
