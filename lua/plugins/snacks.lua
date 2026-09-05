-- Snacks.nvim - picker module replaces the old telescope stack
-- (no build step, actively maintained, also takes over vim.ui.select)
return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      picker = {
        enabled = true,
        sources = {
          -- VSCode-like sidebar file tree (replaces neo-tree) [may want to remove this all together]
          explorer = {
            hidden = true, -- always show hidden files
            win = {
              -- <C-b> defaults to list_scroll_up inside pickers, which shadows
              -- the global toggle; make it close the sidebar instead
              list = { keys = { ['<c-b>'] = 'close' } },
              input = { keys = { ['<c-b>'] = { 'close', mode = { 'n', 'i' } } } },
            },
          },
        },
      },
      notifier = { enabled = true },
      -- Inline images (kitty graphics protocol - works in ghostty; tmux needs allow-passthrough)
      image = { enabled = true },
      -- Only highlight the indent scope the cursor is in (no full rainbow guides)
      indent = {
        enabled = true,
        indent = { enabled = false }, -- no guides on every level
        scope = { enabled = true },   -- just the current cursor scope
        animate = { enabled = false }, -- instantaneous
      },
      -- Bottom split terminal (replaces toggleterm)
      terminal = {
        win = { position = 'bottom', height = 15 },
      },
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
      vim.keymap.set('n', '<leader>sm', function() Snacks.picker.git_status() end,
        { desc = '[S]earch git [M]odified files' })
      vim.keymap.set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sW', function() Snacks.picker.grep({ search = vim.fn.expand('<cWORD>') }) end,
        { desc = '[S]earch current big [W]ORD' })
      vim.keymap.set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sl', function() Snacks.picker.grep() end, { desc = '[S]earch [L]ive Grep' })
      vim.keymap.set('n', '<leader>sp', function() Snacks.picker.grep({ search = vim.fn.input('Grep > ') }) end,
        { desc = '[S]earch [P]roject files for string' })

      -- fuzzy find in current file
      vim.keymap.set('n', '<C-f>', function() Snacks.picker.lines() end,
        { desc = '[/] Fuzzily search in current buffer' })

      -- Clear notifications
      vim.keymap.set({ 'n', 'v' }, '<leader><leader>c', function() Snacks.notifier.hide() end,
        { desc = '[C]lear Notifications' })

      -- File explorer sidebar (replaces neo-tree) [may want to remove this all together]
      local function explorer_toggle()
        vim.cmd('stopinsert')
        local p = Snacks.picker.get({ source = 'explorer' })[1]
        if p then p:close() else Snacks.explorer() end
      end
      vim.keymap.set('n', '<leader>pv', function() Snacks.explorer() end, { desc = '[P]roject [V]iew' })
      vim.keymap.set({ 'n', 'i', 'v' }, '<C-b>', explorer_toggle, { desc = 'Follow vscode convention' })

      -- Toggle terminal
      vim.keymap.set({ 'n', 'i', 'v', 't' }, '<M-C-Space>', function() Snacks.terminal.toggle() end,
        { desc = 'Toggle terminal' })
      vim.keymap.set('n', '<leader>tt', function() Snacks.terminal.toggle() end, { desc = '[T]oggle [T]erminal, recommend ctrl + alt + space' })
    end
  },
}
