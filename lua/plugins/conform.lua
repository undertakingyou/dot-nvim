-- Autoformat

local function get_python_formatters()
  local cwd = vim.fn.getcwd()
  local pyproject_path = cwd .. '/pyproject.toml'

  if vim.fn.filereadable(pyproject_path) == 1 then
    local content = vim.fn.readfile(pyproject_path)
    local text = table.concat(content, '\n')

    if text:match '%[tool%.black%]' or text:match '%[tool%.isort%]' then
      return { 'black', 'isort' }
    end
  end

  return { 'ruff_fix', 'ruff_format', 'ruff_organize_imports' }
end

return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = function(bufnr)
    --   -- Disable "format_on_save lsp_fallback" for languages that don't
    --   -- have a well standardized coding style. You can add additional
    --   -- languages here or re-enable it for the disabled ones.
    --   local disable_filetypes = { c = true, cpp = true }
    --   if disable_filetypes[vim.bo[bufnr].filetype] then
    --     return nil
    --   else
    --     return {
    --       timeout_ms = 500,
    --       lsp_format = 'fallback',
    --     }
    --   end
    -- end,
    format_on_save = {
      timeout_ms = 5000,
      lsp_format = 'fallback',
    },
    formatters = {
      sqlfluff = {
        command = 'sqlfluff',
        args = { 'format', '--dialect', 'postgres', '--disable-progress-bar', '-n', '-' },
      },
    },
    formatters_by_ft = {
      -- You can use 'stop_after_first' to run the first available formatter from the list
      lua = { 'stylua' },
      python = get_python_formatters(),
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      ['markdown.mdx'] = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'prettierd', 'prettier', stop_after_first = true },
      jsonc = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'prettierd', 'prettier', stop_after_first = true },
      less = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      graphql = { 'prettierd', 'prettier', stop_after_first = true },
      handlebars = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
      sql = { 'sqlfluff' },
    },
  },
}
