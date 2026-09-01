-- Syntax formatting
return {
  {
    'stevearc/conform.nvim',
    cmd = 'ConformInfo',
    keys = {
      {
        '<leader>f',
        function() require('conform').format({ async = true, lsp_format = 'fallback' }) end,
        mode = { 'n', 'v' },
        desc = '[F]ormat buffer (or selection)',
      },
    },
    opts = {
      formatters_by_ft = {
        -- lua = { 'stylua' },
        -- ruff_organize_imports = `ruff check --select I --fix` (import sorting)
        python = { 'ruff_organize_imports', 'ruff_format' },
        sh = { 'shfmt' },
      },
      formatters = {
        shfmt = { prepend_args = { '-i', '2' } },
      },
    },
  },
}
