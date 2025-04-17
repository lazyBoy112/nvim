local opts = require'core.utils.mappings'.opts
return {
  { 'n', '<leader>ff', '<cmd>Telescope find_files theme=ivy<cr>', opts },
  { 'n', '<leader>fw', '<cmd>Telescope live_grep theme=ivy<cr>', opts },
  { 'n', '<leader>fh', '<cmd>Telescope help_tags theme=ivy<cr>', opts },
  { 'n', '<leader>fd', '<cmd>Telescope diagnostics theme=ivy<cr>', opts },
  { 'n', '<leader>fb', '<cmd>Telescope buffers theme=ivy<cr>', opts },
  { 'n', '<leader>fk', '<cmd>Telescope keymaps theme=ivy<cr>', opts },
}
