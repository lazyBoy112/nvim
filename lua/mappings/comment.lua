local opts = { noremap=true, silent=true }
return {
  { 'n', '<leader>cl', function() require'Comment.api'.toggle.linewise.current() end , opts },
  { 'n', '<leader>cb', function() require'Comment.api'.toggle.blockwise.current() end, opts },
  { 'x', '<leader>cl', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    require'Comment.api'.toggle.linewise(vim.fn.visualmode())
  end, opts},
  { 'x', '<leader>cb', function()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
    require'Comment.api'.toggle.blockwise(vim.fn.visualmode())
  end, opts},
}
