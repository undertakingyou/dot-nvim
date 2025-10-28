-- I want to see the marks in the gutter.

return {
  'dimtion/guttermarks.nvim',
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
}
