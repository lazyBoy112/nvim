local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap('i', '<C-a>', '', opts)
-- keymap('n', '<C-j>', ':m .+1<CR>==')
-- keymap('n', '<C-k>', ':m .-2<CR>==')
-- keymap('n', '<C-h>', '<<')
-- keymap('n', '<C-l>', '>>')
-- keymap('n', '<tab>', '<cmd>bnext<cr>')
-- keymap('n', '<S-tab>', '<cmd>bprevious<cr>')
keymap('v', '<A-j>', ":m '>+1<CR>gv")
keymap('v', '<A-h>', ":m '>+1<CR>gv")
keymap('v', '<A-k>', '<gv')
keymap('v', '<A-l>', '>gv')

keymap('n', '<ESC>', "<Esc>:noh<CR>", opts)
