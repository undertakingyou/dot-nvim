-- A couple of plugins to help with git. Vim fugitive is extremely powerful

return {
  {
    'tpope/vim-fugitive',
    keys = {
      { '<leader>gb', '<cmd>Git blame<cr>', desc = '[G]it [b]lame' },
    },
  },
  {
    'sindrets/diffview.nvim',
    -- There are quite a few options in there. For now just get this here and then we can customize
  },
}
