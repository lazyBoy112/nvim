local opts = require 'core.utils.mappings'.opts
return {
  { 'n', '[g', '<cmd>Gitsigns prev_hunk<cr>', opts },
  { 'n', ']g', '<cmd>Gitsigns next_hunk<cr>', opts },
  { 'n', '<leader>gb', '<cmd>Gitsigns blame<cr>', opts },
  { 'n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', opts },
  { 'n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', opts },
  { 'n', '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', opts },
}
