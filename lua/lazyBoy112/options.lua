vim.cmd('autocmd!')

-- Utils
vim.scriptencoding= 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.laststatus = 3
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append {'**' }
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.undofile = true
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.updatetime = 100
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.o.timeout = 300
vim.o.timeoutlen = 300
vim.g.mouse = 'a'

-- Ui
vim.wo.number = true
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.cmdheight = 0
vim.opt.inccommand = 'split'
vim.opt.background = 'dark'
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.signcolumn = 'yes'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

vim.opt.fillchars = { eob = " " }
