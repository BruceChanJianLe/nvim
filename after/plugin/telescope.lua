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

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', "<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")


-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension('fzf'))
require('telescope').load_extension('fzf')

