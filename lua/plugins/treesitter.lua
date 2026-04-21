-- Highlight, edit, and navigate code
-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:

return {
  {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {}, -- tree-sitter CLI must be installed system-wide
    config = function()
      require('tree-sitter-manager').setup {
        -- Default Options
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }, -- list of parsers to install at the start of a neovim session
        -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
        auto_install = true, -- if enabled, install missing parsers when editing a new file
        -- highlight = true, -- treesitter highlighting is enabled by default
        -- languages = {}, -- override or add new parser sources
        -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
        -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
      }
    end,
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   branch = 'main',
  --   build = ':TSUpdate',
  --   main = 'nvim-treesitter.config', -- Sets main module to use for opts
  --   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  --   opts = {
  --     ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
  --     -- Autoinstall languages that are not installed
  --     auto_install = true,
  --     highlight = {
  --       enable = true,
  --       -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
  --       --  If you are experiencing weird indenting issues, add the language to
  --       --  the list of additional_vim_regex_highlighting and disabled languages for indent.
  --       additional_vim_regex_highlighting = { 'ruby' },
  --     },
  --     indent = { enable = true, disable = { 'ruby' } },
  --     -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --     incremental_selection = {
  --       enable = true,
  --       keymaps = {
  --         init_selection = '<leader>is',
  --         node_incremental = '<leader>ii',
  --         scope_incremental = '<leader>ic',
  --         node_decremental = '<leader>id',
  --       },
  --     },
  --   },
  -- },
  -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  -- {
  --   'nvim-treesitter/nvim-treesitter-textobjects',
  --   branch = 'main',
  --   -- dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   config = function()
  --     require('nvim-treesitter.config').setup {
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           keymaps = {
  --             ['af'] = '@function.outer',
  --             ['if'] = '@function.inner',
  --             ['ac'] = '@class.outer',
  --             ['ic'] = '@class.inner',
  --             ['aa'] = '@parameter.outer',
  --             ['ia'] = '@parameter.inner',
  --             ['al'] = '@loop.outer',
  --             ['il'] = '@loop.inner',
  --             ['ai'] = '@conditional.outer',
  --             ['ii'] = '@conditional.inner',
  --             ['a/'] = '@comment.outer',
  --             ['i/'] = '@comment.inner',
  --             ['ab'] = '@block.outer',
  --             ['ib'] = '@block.inner',
  --             ['as'] = '@statement.outer',
  --             ['is'] = '@statement.inner',
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- -- Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  -- },
}
