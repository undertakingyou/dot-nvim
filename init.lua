--[[

=====================================================================
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   UNDERTAKINGYOU   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

Kickstart offers a great guide if you need it. Please check that out in their init.lua. 
https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

 NOTE: Look for lines like this

  Throughout the file. These are for you, the reader, to help you understand what is happening.
  They also help remind me of what I did and why :D

--]]
-- NOTE: Change some settings just for use with vscode.
-- This will enable us to do things with the vscode-neovim plugin.
-- Anything in the else is our regular Neovim config.
if vim.g.vscode then
  --- Do my thing here
  require 'nvim-vscode.keymap'
else
  -- Ordinary vim

  -- Set <space> as the leader key
  -- See `:help mapleader`
  --  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
  vim.g.mapleader = ' '
  vim.g.maplocalleader = ' '

  -- Set to true if you have a Nerd Font installed and selected in the terminal
  vim.g.have_nerd_font = true

  -- [[ Setting options ]]
  -- See `:help vim.opt`
  -- NOTE: You can change these options as you wish!
  --  For more options, you can see `:help option-list`

  -- Make line numbers default
  vim.opt.number = true
  -- You can also add relative line numbers, to help with jumping.
  --  Experiment for yourself to see if you like it!
  -- vim.opt.relativenumber = true

  -- Enable mouse mode, can be useful for resizing splits for example!
  vim.opt.mouse = 'a'

  -- Don't show the mode, since it's already in the status line
  vim.opt.showmode = false

  -- Tabstops
  vim.opt.tabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.expandtab = true

  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
  end)

  -- Enable break indent
  vim.opt.breakindent = true

  -- Save undo history
  vim.opt.undofile = true

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Keep signcolumn on by default
  vim.opt.signcolumn = 'yes'

  -- Decrease update time
  vim.opt.updatetime = 250

  -- Decrease mapped sequence wait time
  vim.opt.timeoutlen = 300

  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  vim.opt.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

  -- Preview substitutions live, as you type!
  vim.opt.inccommand = 'split'

  -- Show which line your cursor is on
  vim.opt.cursorline = true

  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 10

  -- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
  -- instead raise a dialog asking if you wish to save the current file(s)
  -- See `:help 'confirm'`
  vim.opt.confirm = true

  -- [[ Basic Keymaps ]]
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

  -- File navigation
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

  -- [[ Basic Autocommands ]]
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

  -- [[ Install `lazy.nvim` plugin manager ]]
  --    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
  local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
      error('Error cloning lazy.nvim:\n' .. out)
    end
  end ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)

  -- [[ Configure and install plugins ]]
  --
  --  To check the current status of your plugins, run
  --    :Lazy
  --
  --  You can press `?` in this menu for help. Use `:q` to close the window
  --
  --  To update plugins you can run
  --    :Lazy update
  --
  -- NOTE: Here is where you install your plugins.
  -- Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  -- Plugins can also be added by using a table, with the first argument being the link
  -- and the following keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
  --

  -- Alternatively, use `config = function() ... end` for full control over the configuration.
  -- If you prefer to call `setup` explicitly, use:
  --    {
  --        'lewis6991/gitsigns.nvim',
  --        config = function()
  --            require('gitsigns').setup({
  --                -- Your gitsigns configuration here
  --            })
  --        end,
  --    }
  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.
  -- See whichkey.lua for an example.

  -- NOTE:
  -- I have decided, in an attempt to keep things clean, keep plugins in a directory based on these rules
  -- 1. Can it all be done on one line?
  require('lazy').setup 'plugins'

  -- The line beneath this is called `modeline`. See `:help modeline`
  -- vim: ts=2 sts=2 sw=2 et
end
