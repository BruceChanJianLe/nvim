-- Git plugins
return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
      vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>");
      vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<CR>");
      vim.keymap.set("n", "<leader>gf", "<cmd>Git fetch<CR>");
      vim.keymap.set("n", "<leader>gba", "<cmd>Git blame<CR>");
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
    },
    config = function()
      local status_ok, gitsigns = pcall(require, "gitsigns")
      if not status_ok then
        return
      end
      gitsigns.setup {
        signs                        = {
          add = { text = '▎' },
          change = { text = '▎' },
          delete = { text = '▸' },
          topdelete = { text = '▸' },
          changedelete = { text = '▸' },
          untracked = { text = '▎' },
        },
        signs_staged_enable          = true,
        signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir                 = {
          interval = 1000,
          follow_files = true,
        },
        auto_attach                  = true,
        attach_to_untracked          = true,
        current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts      = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
          virt_text_priority = 100,
        },
        current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        sign_priority                = 6,
        update_debounce              = 100,
        status_formatter             = nil, -- Use default
        max_file_length              = 40000,
        preview_config               = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
      }

      -- Show commit msg in floating window
      vim.keymap.set('n', '<leader>gb', gitsigns.blame_line, { desc = '[S]how git commit information' })
      -- Preview git hunk
      vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = '[P]review hunk information' })
      -- Preview git hunk
      vim.keymap.set('n', ']c', gitsigns.next_hunk, { desc = '[J]ump to next hunk' })
      -- Preview git hunk
      vim.keymap.set('n', '[c', gitsigns.prev_hunk, { desc = '[J]ump to previous hunk' })
    end
  },

  -- Prime worktrees!
  {
    'theprimeagen/git-worktree.nvim',
    opts = {},
    config = function()
      vim.keymap.set({ 'n', 'v' }, "<leader>ws",
        "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", { desc = 'git [W]orktree [S]witch' })
      vim.keymap.set({ 'n', 'v' }, "<leader>wc",
        "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
        { desc = 'git [W]orktree [C]reate' })
    end
  },

}
