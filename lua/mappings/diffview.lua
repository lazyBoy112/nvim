local opts = require 'core.utils.mappings'.opts
return {
  { 'n', '<leader>gh', '<cmd>DiffviewFileHistory<cr>', opts },
  { 'n', '<leader>gc', '<cmd>DiffviewClose<cr>', opts },
}
