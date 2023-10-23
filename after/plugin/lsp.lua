local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  -- 'tsserver',
  'lua_ls',
  'rust_analyzer',
  'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()
-- lsp.configure('lua_ls', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

local cmp = require('cmp')
local luasnip = require('luasnip')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-u>'] = cmp.mapping.scroll_docs(-4),
  ['<C-d>'] = cmp.mapping.scroll_docs(4),
  ['<C-j>'] = cmp.mapping(function(--[[ fallback ]])
    -- if cmp.visible() then
    --   cmp.select_next_item()
    -- elseif luasnip.expand_or_jumpable() then
    --   luasnip.expand_or_jump()
    -- else
    --   fallback()
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    end
  end, { 'i', 's' }),
  ['<C-k>'] = cmp.mapping(function(--[[ fallback ]])
    -- if cmp.visible() then
    --   cmp.select_prev_item()
    -- elseif luasnip.jumpable(-1) then
    -- luasnip.jump(-1)
    -- else
    --   fallback()
    -- end
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    end
  end, { 'i', 's' }),
})

-- Disable Tabs
-- cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Setup lsp mappings
lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = ' ',
        warn = ' ',
        hint = '',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

-- When no lsp is attached
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

-- Setup other completion after lsp-zero
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- completion = {
  --   autocomplete = false,
  -- },

  -- Order of sources matter, top has higher priority
  -- Configure: keyword_length, priority, max_item_count
  sources = {
    { name = 'nvim_lsp' , keyword_length = 17},
    { name = 'luasnip' , keyword_length = 17},
    { name = 'buffer', keyword_length = 17 },
    { name = 'path' , keyword_length = 17},
  },

  experimental = {
    -- Display virutal text
    -- This feature conflict with copilot.vim's preview
    -- Set to false if using copilot.vim
    ghost_text = { true, hl_group = 'LineNr' }
  }
}

luasnip.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = false,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,
}

-- Use friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

vim.diagnostic.config({
    virtual_text = true,
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
require'lspconfig'.clangd.setup{}

-- References
-- https://www.youtube.com/watch?v=IR6pfkqjbw8
-- https://www.youtube.com/watch?v=BCuyEdDQ5iA

-- Creating your own snippets
-- https://github.com/one-harsh/vscode-cpp-snippets/blob/master/snippets/cpp.json
-- VSCODE snippets: https://github.com/one-harsh/vscode-cpp-snippets
