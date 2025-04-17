local config_path = vim.fn.stdpath('config')..'/lua/mappings'
local files = vim.fn.globpath(config_path, '*.lua', false, true)
local M = {}
M.keymap = {}
M.opts = {
  silent=true,
  noremap=true,
  nowait=true
}

M.setup = function(opts)
  M.keymap = opts or {}
  for _, file in ipairs(files) do
    local modulename = file:gsub(vim.fn.stdpath('config')..'/lua/', '')
    modulename = modulename:gsub('.lua', '')
    modulename = modulename:gsub('/', '.')
    local module = require(modulename)
    if type(module) ~= 'table' then
      print('Error: '..modulename..' is not a table')
      return
    end

    -- print(vim.inspect(module))
    M.keymap = vim.list_extend(M.keymap, module)
  end
  --M.keymap = vim.tbl_extend('force', moduleMap, opts or {})
  for _, key in ipairs(M.keymap) do
    -- print(vim.inspect(key))
    vim.keymap.set(key[1], key[2], key[3], key[4])
  end
end

return M
