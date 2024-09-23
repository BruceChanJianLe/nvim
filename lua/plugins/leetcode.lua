local leet_arg = "leetcode.nvim"
return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv()[1],
    opts = { arg = leet_arg },
    config = function ()
      local status_ok, leetcode = pcall(require, 'leetcode')
      if not status_ok then
        return
      end

      vim.keymap.set('n', '<leader>tr', '<cmd>Leet run<CR>', { desc = '[L]eetcode [R]un code' })
      vim.keymap.set('n', '<leader>tl', '<cmd>Leet list<CR>', { desc = '[L]eetcode [L]ist questions' })
      vim.keymap.set('n', '<leader>ts', '<cmd>Leet submit<CR>', { desc = '[L]eetcode [S]ubmit code' })
      vim.keymap.set('n', '<leader>tc', '<cmd>Leet console<CR>', { desc = '[L]eetcode toogle [C]onsole' })

      -- setup
      leetcode.setup()
    end
  }
}
