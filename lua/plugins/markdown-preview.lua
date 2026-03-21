-- Markdown preview
return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  -- build = function() vim.fn["mkdp#util#install"]() end,
  build = "cd app && npm install", -- Run :Lazy build markdown-preview.nvim
  config = function()
    vim.keymap.set("n", "<leader>v", "<cmd>MarkdownPreviewToggle<CR>");

    vim.g.mkdp_port = "3333"
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1        -- closes preview when you leave the buffer
    vim.g.mkdp_refresh_slow = 0      -- live refresh as you type
    vim.g.mkdp_browser = ""          -- don't try to open a browser on the server
    -- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    -- -- Ref: https://github.com/iamcco/markdown-preview.nvim/issues/262
    -- vim.cmd(
    --   [[
    -- function OpenMarkdownPreview (url)
    --   execute "silent ! brave-browser --incognito --app=" . a:url
    --   endfunction
    -- ]]
    -- )
  end
}

