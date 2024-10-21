local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', opts)

-- paste from system clipboard
keymap({ 'n', 'v' }, '<leader>p', '"+p', opts)

-- better indent handling
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)
--
-- -- move text up and down
-- keymap("v", "J", ":m .+1<CR>==", opts)
-- keymap("v", "K", ":m .-2<CR>==", opts)
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap('v', 'p', '"_dP', opts)

-- removes highlighting after escaping vim search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- call vscode commands from neovim

-- general keymaps
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")
keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ 'n', 'v' }, '<leader>d', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ 'n', 'v' }, '<leader>a', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ 'n', 'v' }, '<leader>q', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ 'n', 'v' }, '<leader>sf', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ 'n', 'v' }, '<leader>f', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- Window navigation
keymap('n', '<leader>wh', "<cmd>lua require('vscode').action('workbench.action.navigateLeft')<cr>", { desc = 'Move focus to the left window' })
keymap('n', '<leader>wl', "<cmd>lua require('vscode').action('workbench.action.navigateRight')<cr>", { desc = 'Move focus to the right window' })
keymap('n', '<leader>wj', "<cmd>lua require('vscode').action('workbench.action.navigateDown')<cr>", { desc = 'Move focus to the lower window' })
keymap('n', '<leader>wk', "<cmd>lua require('vscode').action('workbench.action.navigateUp')<cr>", { desc = 'Move focus to the upper window' })
keymap('n', '<leader>w/', "<cmd>lua require('vscode').action('workbench.action.splitEditorRight')<cr>", { desc = 'Create a vertical split' })
keymap('n', '<leader>w-', "<cmd>lua require('vscode').action('workbench.action.splitEditorDown')<cr>", { desc = 'Create a horizontal split' })
keymap('n', '<leader>wc', "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<cr>", { desc = 'Close the [c]urrent split' })
keymap('n', '<leader>w=', "<cmd>lua require('vscode').action('workbench.action.evenEditorWidths')<cr>", { desc = 'Make all windows (almost) equal' })
keymap(
  'n',
  '<leader>w1',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex1')<cr>",
  { desc = 'Quick switch to [w]indow [1]', silent = true }
)
keymap(
  'n',
  '<leader>w2',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex2')<cr>",
  { desc = 'Quick switch to [w]indow [2]', silent = true }
)
keymap(
  'n',
  '<leader>w3',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex3')<cr>",
  { desc = 'Quick switch to [w]indow [3]', silent = true }
)
keymap(
  'n',
  '<leader>w4',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex4')<cr>",
  { desc = 'Quick switch to [w]indow [4]', silent = true }
)
keymap(
  'n',
  '<leader>w5',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex5')<cr>",
  { desc = 'Quick switch to [w]indow [5]', silent = true }
)
keymap(
  'n',
  '<leader>w6',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex6')<cr>",
  { desc = 'Quick switch to [w]indow [6]', silent = true }
)
keymap(
  'n',
  '<leader>w7',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex7')<cr>",
  { desc = 'Quick switch to [w]indow [7]', silent = true }
)
keymap(
  'n',
  '<leader>w8',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex8')<cr>",
  { desc = 'Quick switch to [w]indow [8]', silent = true }
)
keymap(
  'n',
  '<leader>w9',
  "<cmd>lua require('vscode').action('workbench.action.openEditorAtIndex9')<cr>",
  { desc = 'Quick switch to [w]indow [9]', silent = true }
)
keymap('n', '<leader><space>', "<cmd>lua require('vscode').action('workbench.action.showAllEditors')<cr>")
keymap('n', '<leader>e', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<cr>")
keymap('n', '-', "<cmd>lua require('vscode').action('vsnetrw.open')<cr>")

-- Folds
keymap({ 'n', 'v' }, 'zM', "<cmd>lua require('vscode').action('editor.foldAll')<cr>")
keymap({ 'n', 'v' }, 'zR', "<cmd>lua require('vscode').action('editor.unfoldAll')<cr>")
keymap({ 'n', 'v' }, 'zc', "<cmd>lua require('vscode').action('editor.fold')<cr>")
keymap({ 'n', 'v' }, 'zC', "<cmd>lua require('vscode').action('editor.foldRecurively')<cr>")
keymap({ 'n', 'v' }, 'zo', "<cmd>lua require('vscode').action('editor.unfold')<cr>")
keymap({ 'n', 'v' }, 'zO', "<cmd>lua require('vscode').action('editor.unfoldRecursively')<cr>")
keymap({ 'n', 'v' }, 'za', "<cmd>lua require('vscode').action('editor.toggleFold')<cr>")

-- Coding actions
keymap('n', '<leader>ss', "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<cr>")
keymap({ 'n', 'v' }, 'gc', "<cmd>lua require('vscode').action('editor.action.commentLine')<cr>")
