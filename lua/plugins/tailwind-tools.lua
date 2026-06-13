-- tailwind-tools.lua
return {
  'TrungNguyen153/tailwind-tools.nvim',
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'arborist-ts/arborist.nvim',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },
  opts = {}, -- your configuration
}
