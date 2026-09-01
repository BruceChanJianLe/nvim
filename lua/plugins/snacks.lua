-- Snacks.nvim - picker module replaces the old telescope stack
-- (no build step, actively maintained, also takes over vim.ui.select)
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      picker = { enabled = true },
    },
    config = function(_, opts)
      require('snacks').setup(opts)

      -- Search Key-binds
      vim.keymap.set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', function() Snacks.picker.pickers() end, { desc = '[S]earch [S]elect Picker' })
      vim.keymap.set('n', '<leader>sd', function() Snacks.picker.diagnostics() end, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', function() Snacks.picker.resume() end, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', function() Snacks.picker.recent() end,
        { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', function() Snacks.picker.buffers() end, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sg', function() Snacks.picker.git_files() end, { desc = '[S]earch [G]it files' })
      vim.keymap.set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sl', function() Snacks.picker.grep() end, { desc = '[S]earch [L]ive Grep' })
      vim.keymap.set('n', '<leader>sp', function() Snacks.picker.grep({ search = vim.fn.input('Grep > ') }) end,
        { desc = '[S]earch [P]roject files for string' })

      vim.keymap.set('n', '<leader>fg', function() Snacks.picker.grep() end, { desc = '[S]earch by [G]rep' })

      vim.keymap.set('n', '<leader>pg', function() Snacks.picker.git_files() end, { desc = '[P]roject [G]it files' })
      vim.keymap.set('n', '<leader>pf', function() Snacks.picker.files() end, { desc = '[P]roject [F]iles' })
      vim.keymap.set('n', '<leader>ps', function() Snacks.picker.grep({ search = vim.fn.input('Grep > ') }) end,
        { desc = '[P]roject [S]earch for string' })

      -- Search WORD under cursor
      vim.keymap.set('n', '<leader>pWs', function() Snacks.picker.grep({ search = vim.fn.expand('<cWORD>') }) end,
        { desc = '[P]roject big [W]ord [S]earch' })
      -- Search word under cursor
      vim.keymap.set('n', '<leader>pws', function() Snacks.picker.grep_word() end,
        { desc = '[P]roject small [W]ord [S]earch' })

      -- fuzzy find in current file
      vim.keymap.set('n', '<leader>fs', function() Snacks.picker.lines() end,
        { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<C-f>', function() Snacks.picker.lines() end,
        { desc = '[/] Fuzzily search in current buffer' })
    end
  },
}
