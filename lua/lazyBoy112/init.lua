-- Options 
local options = require'lazyBoy112.base'.options

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Global mappings 
local var = require'lazyBoy112.base'.globalVar
for key, value in pairs(var) do
  vim.g[key] = value
end

-- Mapping 
local mappings = require 'lazyBoy112.mappings'
for mode, args in pairs(mappings) do
  for _, key in ipairs(args) do
    vim.keymap.set(mode, key[1], key[2], {silent=true, noremap=true})
  end
end

-- load theme
local themes = require 'lazyBoy112.themes'
for hl_group, args in pairs(themes) do
  vim.api.nvim_set_hl(0, hl_group, args)
end

-- Plugins
local plugins = require'lazyBoy112.base'.plugins
local lazypath = vim.fn.stdpath('data')..'/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins)
