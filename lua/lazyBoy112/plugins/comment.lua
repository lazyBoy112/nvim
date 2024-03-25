local status, comment = pcall(require, 'Comment')
if not status then return end

comment.setup({
  toggler = {
    line = '<leader>cl',
    block = '<leader>cb'
  },
  opleader = {
    line = '<leader>cl',
    block = '<leader>cb'
  },
  extra = {
    eol = '<leader>ce',
  }
})
