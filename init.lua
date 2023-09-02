-- Detect OS
local has = vim.fn.has
-- local is_mac = has "macunix"
local is_linux = has "unix"
-- local is_win = has "win32"
-- local is_wsl = has "wsl"
if (is_linux) then
  require 'lazyBoy112.linux'
end

-- zzZ
require 'lazyBoy112.options'
require 'lazyBoy112.mappings'
require 'lazyBoy112.plugins'
