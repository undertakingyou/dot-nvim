-- MCP provider with integration into Avante.
-- See https://ravitemer.github.io/mcphub.nvim/installation.html for install details

return {
  'ravitemer/mcphub.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  build = 'npm install -g mcp-hub@latest', -- Installs `mcp-hub` node binary globally
  config = function()
    require('mcphub').setup()
  end,
}
