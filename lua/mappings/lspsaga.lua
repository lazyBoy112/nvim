local opts = require 'core.utils.mappings'.opts
return {
  { 'n', '<leader>li', '<cmd>Lspsaga incoming_calls<cr>', opts },
  { 'n', '<leader>lo', '<cmd>Lspsaga outgoing_calls<cr>', opts },
  { 'n', '<leader>la', '<cmd>Lspsaga code_action<cr>', opts },
  { 'n', '<leader>lp', '<cmd>Lspsaga peek_definition<cr>', opts },
  { 'n', '<leader>ld', '<cmd>Lspsaga goto_definition<cr>', opts },
  { 'n', 'd[', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opts },
  { 'n', 'd]', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts },
  { 'n', '<leader>lf', '<cmd>Lspsaga finder<cr>', opts },
  { 'n', '<leader>lt', '<cmd>Lspsaga term_toggle<cr>', opts },
  { 'n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts },
  { 'n', '<leader>lr', '<cmd>Lspsaga rename<cr>', opts },
  { 't', '<leader>lt', '<c-\\><c-n><cmd>Lspsaga term_toggle<cr>', opts },
  { 't', '<ESC><ESC>', '<c-\\><c-n>', opts },
}
