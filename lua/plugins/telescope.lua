return {
  {
    'nvim-telescope/telescope.nvim',

    tag = '0.1.5',

    dependencies = { 'nvim-lua/plenary.nvim',
      -- Fuzzy search in current file
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        -- dependencies = {
        --   'junegunn/fzf',
        --   commit = '7191ebb615f5d6ebb', -- fzf version 0.20.0
        --   config = function() vim.fn['fzf#install']() end}
      },
      -- Use riggrep with flags
      "nvim-telescope/telescope-rg.nvim",
      -- Show available snippets
      { "benfowler/telescope-luasnip.nvim" } --, module = "telescope._extensions.luasnip", --[[ lazy-load ]] },
    },

    config = function()
      require('telescope').setup({
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
      })

      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension('fzf'))
      pcall(require('telescope').load_extension('luasnip'))
      pcall(require('telescope').load_extension('git_worktree'))

      local builtin = require('telescope.builtin')

      -- TJ
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[ ] Find existing buffers' })
      -- prime
      vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = '[P]roject [G]it files' })
      -- others
      vim.keymap.set('n', "<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",  { desc = '[F]ile [R]ipgrep'})

      -- To discuss and remove
      -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' })

      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      -- vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = '[S]earch [F]iles' })

      -- vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end,
      { desc = '[P]roject [S]earch for string'})
      -- Search WORD under cursor
      vim.keymap.set('n', '<leader>pWs', function()
        local word = vim.fn.expand('<cWORD>')
        builtin.grep_string({ search = word })
      end,
      { desc = '[P]roject big [W]ord [S]earch'})
      -- Search word under cursor
      vim.keymap.set('n', '<leader>pws', function()
        local word = vim.fn.expand('<cword>')
        builtin.grep_string({ search = word })
      end,
      { desc = '[P]roject small [W]ord [S]earch'})

      -- vim.keymap.set('n', '<C-p>', function()
      --   local opt = { layout_config = { horizontal = { prompt_position = "top" } } }
      --   builtin.find_files(opt)
      -- end, {})

      -- fuzzy find in current file
      function SearchFile()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        local opt = { sorting_strategy = "ascending", prompt_position = "top" }
        require('telescope.builtin').current_buffer_fuzzy_find(opt)
      end

      vim.keymap.set('n', '<leader>fs', "<cmd>lua earchFile()<CR>", { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<C-f>', "<cmd>lua SearchFile()<CR>", { desc = '[/] Fuzzily search in current buffer' })
    end
  },
}
