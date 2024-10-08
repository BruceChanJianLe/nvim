-- Highlights other instances of word under your cursor
return {
  {
    "RRethy/vim-illuminate",
    config = function()
      local status_ok, illuminate = pcall(require, "illuminate")
      if not status_ok then
        return
      end

      -- default configuration
      illuminate.configure({
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
          providers = { 'lsp', 'treesitter' }
        },
      })

      vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "IncSearch" })
    end
  }
}
