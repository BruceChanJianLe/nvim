-- Commenting
return {
  {
    'numToStr/Comment.nvim',
    opts = {},
    config = function()
      require("Comment").setup {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = 'gcc',
          ---Block-comment toggle keymap
          block = 'gbc',
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = 'gc',
          ---Block-comment keymap
          block = 'gb',
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = 'gcO',
          ---Add comment on the line below
          below = 'gco',
          ---Add comment at the end of line
          eol = 'gcA',
        },
        ---Enable keybindings
        ---NOTE: If given `false` then the plugin won't create any mappings
        mappings = {
          ---Operator-pending mapping;
          --`gcc`               : line-comment  the current line
          --`gbc`               : block-comment the current line
          --`gc[count]{motion}` : line-comment  the region contained in {motion}
          --`gb[count]{motion}` : block-comment the region contained in {motion}
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      }
      local api = require('Comment.api')
      local esc = vim.api.nvim_replace_termcodes(
        '<ESC>', true, false, true
      )

      -- Toggle current line (linewise) using C-/
      vim.keymap.set('n', '<C-_>', api.toggle.linewise.current)
      vim.keymap.set('i', '<C-_>', [[<ESC>:norm lmo<CR>`o]])
      -- Toggle selection (linewise)
      vim.keymap.set('x', '<C-_>', function()
        vim.api.nvim_feedkeys(esc, 'nx', false)
        api.toggle.linewise(vim.fn.visualmode())
      end)
    end
  },
}
