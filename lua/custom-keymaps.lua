-- [[ Basic Keymaps ]]
-- Custom keymaps to help keep things nice and tidy.
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- These are some of my personal favorite window mappings. Enough so that I have missed them in VS Code
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>w/', '<C-w>v', { desc = 'Create a vertical split' })
vim.keymap.set('n', '<leader>w-', '<C-w>s', { desc = 'Create a horizontal split' })
vim.keymap.set('n', '<leader>wc', '<C-w>c', { desc = 'Close the [c]urrent split' })
vim.keymap.set('n', '<leader>w=', '<C-w>=', { desc = 'Make all windows (almost) equal' })
vim.keymap.set('n', '<leader>w1', ':1wincmd w<cr>', { desc = 'Quick switch to [w]indow [1]', silent = true })
vim.keymap.set('n', '<leader>w2', ':2wincmd w<cr>', { desc = 'Quick switch to [w]indow [2]', silent = true })
vim.keymap.set('n', '<leader>w3', ':3wincmd w<cr>', { desc = 'Quick switch to [w]indow [3]', silent = true })
vim.keymap.set('n', '<leader>w4', ':4wincmd w<cr>', { desc = 'Quick switch to [w]indow [4]', silent = true })
vim.keymap.set('n', '<leader>w5', ':5wincmd w<cr>', { desc = 'Quick switch to [w]indow [5]', silent = true })
vim.keymap.set('n', '<leader>w6', ':6wincmd w<cr>', { desc = 'Quick switch to [w]indow [6]', silent = true })
vim.keymap.set('n', '<leader>w7', ':7wincmd w<cr>', { desc = 'Quick switch to [w]indow [7]', silent = true })
vim.keymap.set('n', '<leader>w8', ':8wincmd w<cr>', { desc = 'Quick switch to [w]indow [8]', silent = true })
vim.keymap.set('n', '<leader>w9', ':9wincmd w<cr>', { desc = 'Quick switch to [w]indow [9]', silent = true })
vim.keymap.set('n', '<leader>wC1', ':1wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [1]', silent = true })
vim.keymap.set('n', '<leader>wC2', ':2wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [2]', silent = true })
vim.keymap.set('n', '<leader>wC3', ':3wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [3]', silent = true })
vim.keymap.set('n', '<leader>wC4', ':4wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [4]', silent = true })
vim.keymap.set('n', '<leader>wC5', ':5wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [5]', silent = true })
vim.keymap.set('n', '<leader>wC6', ':6wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [6]', silent = true })
vim.keymap.set('n', '<leader>wC7', ':7wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [7]', silent = true })
vim.keymap.set('n', '<leader>wC8', ':8wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [8]', silent = true })
vim.keymap.set('n', '<leader>wC9', ':9wincmd w<cr>', { desc = 'Quick [c]lose [w]indow [9]', silent = true })

-- Delete buffer but keep window open. Good for buffer list cleanup and keeping things lean
vim.keymap.set('n', '<leader>bd', '<cmd>bprevious <bar> bdelete # <cr>', { desc = 'Truly close the current buffer', silent = true })

-- File navigation
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
