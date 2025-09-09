-- Helper for golang. Should only be loaded with go files

return {
  'olexsmir/gopher.nvim',
  ft = 'go',
  config = function(_, opts)
    require('gopher').setup(opts)
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
