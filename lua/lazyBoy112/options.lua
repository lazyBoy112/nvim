local opts = { silent=true }
vim.opt.list          = true
vim.opt.listchars     = { space = ' ', tab = '▏ ', eol='↵' } -- ⤶↵
vim.opt.fillchars     = { eob = ' ' }


vim.opt.number        = true
vim.opt.termguicolors = true
vim.opt.clipboard     = 'unnamedplus'
vim.opt.undofile      = true
vim.opt.cursorline    = true
vim.opt.smartindent   = true
vim.opt.modifiable    = true
vim.opt.formatoptions = 'jcql' -- 'jcroql'
vim.opt.swapfile      = false

vim.opt.signcolumn    = 'auto'
vim.opt.numberwidth   = 1

vim.opt.shiftwidth    = 2
vim.opt.tabstop       = 2
--vim.opt.expandtab   = true
vim.opt.smarttab      = true

vim.g.mapleader = ' '

-- Load mappings
local mappings = require 'lazyBoy112.mappings'
for mode, args in pairs(mappings) do
	for _, key in ipairs(args) do
		vim.keymap.set(mode, key[1], key[2], opts)
	end
end

-- Load themes
local themes = require 'lazyBoy112.themes'
for hl_group, args in pairs(themes) do
	--vim.api.nvim_set_hl(0, args[1], { fg=args[2], bg=args[3] })
	vim.api.nvim_set_hl(0, hl_group, args)
end
