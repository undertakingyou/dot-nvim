-- Highlight, edit, and navigate code

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      -- Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<leader>is',
          node_incremental = '<leader>ii',
          scope_incremental = '<leader>ic',
          node_decremental = '<leader>id',
        },
      },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  },
  -- Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
              ['ai'] = '@conditional.outer',
              ['ii'] = '@conditional.inner',
              ['a/'] = '@comment.outer',
              ['i/'] = '@comment.inner',
              ['ab'] = '@block.outer',
              ['ib'] = '@block.inner',
              ['as'] = '@statement.outer',
              ['is'] = '@statement.inner',
            },
          },
        },
      }
    end,
  },
}
