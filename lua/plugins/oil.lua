-- Quick files management
return {
  {
    'stevearc/oil.nvim',
    opts = {},
    config = function()
      local status_ok, oil = pcall(require, "oil")
      if not status_ok then
        return
      end

      oil.setup({
        default_file_explorer = false,
        -- delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        win_options = {
          wrap = true,
        }
      })
      -- Open parent directory in current window
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

      -- Open parent directory in floating window
      vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent directory in floating window" })
    end
  }
}
