return {

  -- use jj as as ESC
  vim.api.nvim_set_keymap('i', 'jj', '<ESC>', { noremap = true }),

  -- disable ctrl-z to not suspend vim in the background
  vim.api.nvim_set_keymap('', '<c-z>', '', { noremap = true }),

  -- disable Q altogether
  vim.keymap.set('n', 'Q', '<nop>'),

  -- move current line up or down
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),

  -- keep cursor center when moving page up/down
  vim.keymap.set('n', '<C-d>', '<C-d>zz'),
  vim.keymap.set('n', '<C-u>', '<C-u>zz'),

  -- overwrite selected text with whats in your register without loosing what's in the register
  vim.keymap.set('x', '<leader>p', '"_dP'),

  -- delete into void. this will delete what you want, but not overwrite your register
  vim.keymap.set('n', '<leader>d', '"_d'),
  vim.keymap.set('v', '<leader>d', '"_d'),

  -- pressing <leader>y will copy selected text into system clipboard
  vim.keymap.set('n', '<leader>y', '"+y'),
  vim.keymap.set('v', '<leader>y', '"+y'),
  vim.keymap.set('n', '<leader>Y', '"+Y'),

  -- replace all occurences of the word the cursor is currently on
  vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]),

  vim.api.nvim_create_user_command('JsonFormat', function()
    vim.cmd [[setfiletype json]]
    vim.cmd [[%!jq .]]
  end, { nargs = 0 }),
}
