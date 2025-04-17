local opts = require'core.utils.mappings'.opts
return {
  { 'n', '<leader>u', function() require'undotree'.toggle() end, opts },
}
