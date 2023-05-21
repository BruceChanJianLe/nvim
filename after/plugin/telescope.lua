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
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', function()
--   local opt = { layout_config = { horizontal = { prompt_position = "top" } } }
--   builtin.find_files(opt)
-- end, {})
vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', "<leader>fg", "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', "<leader>fr", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>")

-- Enable telescope fzf native, if installed
require('telescope').load_extension('fzf')
require('telescope').load_extension('luasnip')

-- fuzzy find in current file
function SearchFile()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  local opt = { sorting_strategy = "ascending", prompt_position = "top" }
  require('telescope.builtin').current_buffer_fuzzy_find(opt)
end

vim.keymap.set('n', '<leader>fs', "<cmd>lua SearchFile()<CR>", { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<C-f>', "<cmd>lua SearchFile()<CR>", { desc = '[/] Fuzzily search in current buffer' })
