-- [[ Basic Autocommands ]]
-- Custome commands that are nice to have available to us.
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Automatically turn on csv view
-- Requires the csvview.nvim plugin to be installed
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'csv',
  desc = 'Enable CSV View on .csv files',
  callback = function()
    require('csvview').enable()
  end,
})
