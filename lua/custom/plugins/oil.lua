return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      columns = { 'icon' },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      keymaps = {
        ['<C-h>'] = false,
        ['<M-h>'] = 'actions.select_split',
        ['g.'] = 'actions.toggle_hidden',
        [':q'] = 'actions.close',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          -- always hide .git, .idea and node_modules folder
          if name == '.git' or name == '.idea' or name == 'node_modules' then
            return true
          end
          return false
        end,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '<space>-', require('oil').toggle_float)
  end,
}
