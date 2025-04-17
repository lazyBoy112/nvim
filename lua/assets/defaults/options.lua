local M = {}
local default_options = {
	mouse = 'a',
	clipboard = 'unnamedplus',
	swapfile = false,
	completeopt = 'menuone,noinsert,noselect',
	signcolumn = 'yes',
	undofile = true,
	showcmd = true,
	cursorline = true,
	hlsearch = true,
	backup = false,
	syntax = 'on',
	cmdheight = 0,
	showmode = false,
	fillchars = {
		eob = ' '
	},

	number = true,
	relativenumber = true,
	showmatch = true,
  foldenable = true,
  foldlevel = 99,
	foldmethod = 'expr',
	foldexpr = 'v:lua.vim.lsp.foldexpr()',
	colorcolumn = '80', -- line lenght marker at 80 columns

	splitright = true,
	splitbelow = true,
	ignorecase = true,
	smartcase = true,
	linebreak = true,
	termguicolors = true,
	laststatus = 3,

	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	smartindent = true,
	smarttab = true,

	hidden = true,
	history = 100,
	lazyredraw = true,
	synmaxcol = 240,
	updatetime = 250,

	listchars = {
	},
	winborder = 'none',
	wrap = false,
	encoding = 'utf-8',
	fileencoding = 'utf-8',
	breakindent = true,
  timeout = true,
  timeoutlen = 500,
}

M.setup = function(opts)
	-- disable intro 
	vim.opt.shortmess:append 'sI'
	vim.g.mapleader = ' '
	local option_setup = vim.tbl_deep_extend('force', default_options, opts or {})
	for key, value in pairs(option_setup) do
		vim.opt[key] = value
	end
end

return M
