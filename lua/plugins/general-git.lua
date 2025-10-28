-- A couple of plugins to help with git. Vim fugitive is extremely powerful

return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gb', '<cmd>Git blame<cr>', desc = '[G]it [b]lame' },
    },
  },
  {
    -- TODO: Update this to use this git blame instead of something vim-fugitive
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFileHistory', 'DiffviewRefresh', 'DiffviewFocusFiles' },
    config = function()
      require('diffview').setup {
        diff_binaries = false,
        enhanced_diff_hl = false,
        use_icons = true,
        show_help_hints = true,
        watch_index = true,

        view = {
          default = {
            layout = 'diff2_horizontal',
            disable_diagnostics = false,
            winbar_info = false,
          },
          merge_tool = {
            layout = 'diff3_horizontal',
            disable_diagnostics = true,
            winbar_info = true,
          },
          file_history = {
            layout = 'diff2_horizontal',
            disable_diagnostics = false,
            winbar_info = false,
          },
        },

        file_panel = {
          listing_style = 'tree',
          tree_options = {
            flatten_dirs = true,
            folder_statuses = 'only_folded',
          },
          win_config = {
            position = 'left',
            width = 35,
            win_opts = {},
          },
        },

        file_history_panel = {
          log_options = {
            git = {
              single_file = {
                diff_merges = 'first-parent',
                follow = true,
              },
              multi_file = {
                diff_merges = 'first-parent',
              },
            },
          },
          win_config = {
            position = 'bottom',
            height = 16,
            win_opts = {},
          },
        },

        hooks = {
          view_opened = function(view)
            print(('Diffview opened: %s on tab %d'):format(view.class:name(), view.tabpage))
          end,
          view_closed = function(view)
            print(('Diffview closed: %s'):format(view.class:name()))
          end,
          diff_buf_read = function(bufnr)
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.colorcolumn = ''
            vim.opt_local.relativenumber = false
          end,
        },
      }
    end,
    keys = {
      { '<leader>gdo', '<cmd>DiffviewOpen<cr>', desc = '[G]it [d]iff [o]pen' },
      { '<leader>gdc', '<cmd>DiffviewClose<cr>', desc = '[G]it [d]iff [c]lose' },
      { '<leader>gdh', '<cmd>DiffviewFileHistory<cr>', desc = '[G]it [d]iff [h]istory' },
      { '<leader>gdt', '<cmd>DiffviewToggleFiles<cr>', desc = '[G]it [d]iff [t]oggle files' },
      { '<leader>gdf', '<cmd>DiffviewFocusFiles<cr>', desc = '[G]it [d]iff [f]ocus files' },
      { '<leader>gdr', '<cmd>DiffviewRefresh<cr>', desc = '[G]it [d]iff [r]efresh' },
      { '<leader>gdm', '<cmd>DiffviewOpen origin/master...HEAD<cr>', desc = '[G]it [d]iff vs [m]aster' },
    },
  },
}
