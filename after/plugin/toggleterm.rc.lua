local status, toggleterm = pcall(require, 'toggleterm')
if not status then return end
print('toggleterm')
vim.cmd('set hidden')
-- vim.cmd[[
-- autocmd TermEnter term://*toggleterm#*
--       \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
--
-- " By applying the mappings this way you can pass a count to your
-- " mapping to open a specific window.
-- " For example: 2<C-t> will open terminal 2
-- nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
-- inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
-- ]]
toggleterm.setup({
  --open_mapping = '<leader>t',
  hide_numbers = false, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  -- direction = 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell,
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
})
