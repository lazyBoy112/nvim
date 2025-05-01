local opts = require 'core.utils.mappings'.opts
return {
  { 'n', '<C-h>', '<cmd>wincmd h<cr>', opts },
  { 'n', '<C-j>', '<cmd>wincmd j<cr>', opts },
  { 'n', '<C-k>', '<cmd>wincmd k<cr>', opts },
  { 'n', '<C-l>', '<cmd>wincmd l<cr>', opts },
  { 'n', '<C-m>', '<C-w>=', opts },
  { 'n', '<C-left>', '<C-w><', opts },
  { 'n', '<C-right>', '<C-w>>', opts },
  { 'n', '<C-down>', '<C-w>-', opts },
  { 'n', '<C-up>', '<C-w>+', opts },
  { 'n', '<A-j>', ':m .+1<CR>==', opts },
  { 'n', '<A-k>', ':m .-2<CR>==', opts },
  { 'n', '<A-h>', '<<', opts },
  { 'n', '<A-l>', '>>', opts },
  { 'n', '<leader>bc', '<cmd>e $MYVIMRC | :cd %:p:h<cr>', opts },
  { 'n', '<leader>bd', '<cmd>bd<cr>', opts },

  { 'n', '<tab>', '<cmd>bnext<cr>', opts },
  { 'n', '<S-tab>', '<cmd>bprevious<cr>', opts },

  { 'n', '<leader>bf', '<cmd>foldclose<cr>', opts },
  { 'n', '<leader>bg', '<cmd>foldopen<cr>', opts },
  { 'n', '<leader>bv', '<cmd>source $MYVIMRC<cr>', opts },

  { 'i', '<C-h>' ,'<C-\\><C-N><C-w>h', opts },
  { 'i', '<C-j>' ,'<C-\\><C-N><C-w>j', opts },
  { 'i', '<C-k>' ,'<C-\\><C-N><C-w>k', opts },
  { 'i', '<C-l>' ,'<C-\\><C-N><C-w>l', opts },


  { 'v', '<A-j>', ":m '>+1<CR> gv", {} },
  { 'v', '<A-k>', ":m '<-2<CR> gv", {} },
  { 'v', '<A-h>', '<gv', opts },
  { 'v', '<A-l>', '>gv', opts },
  { 'v', 'p', 'P', opts },
}
