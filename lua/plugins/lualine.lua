-- Very customizable (read controllable) status line

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    opt = true,
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
      },
      sections = {
        lualine_x = {
          { 'filetype', separator = { right = nil, left = nil } },
          { 'fileformat', separator = { right = nil, left = nil } },
          { 'encoding', separator = { right = nil, left = nil } },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    }
  end,
}
