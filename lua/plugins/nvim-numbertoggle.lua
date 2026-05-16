-- I find myself seldom using relative line numbers, but when I do is is always for movement. I have a small function that I can use to toggle thas with a keymap, but I have to remember. This plugin attempts to do just that.
--
--
-- Toggle between relative and regular line numbers
-- local function toggle_line_numbers()
--   if vim.wo.relativenumber then
--     vim.wo.relativenumber = false
--     vim.wo.number = true
--   else
--     vim.wo.relativenumber = true
--     vim.wo.number = true
--   end
-- end
--
-- vim.keymap.set('n', '<leader>tr', toggle_line_numbers, { desc = 'Toggle relative line numbers' })

return {
  'sitiom/nvim-numbertoggle',
}
