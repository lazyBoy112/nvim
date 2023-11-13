local plugins = {
	{ 'neovim/nvim-lspconfig' },
	{ 'norcalli/nvim-colorizer.lua' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp" },
	{ 'saadparwaiz1/cmp_luasnip' },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-tree/nvim-web-devicon' },
	{ 'nvimdev/lspsaga.nvim', dependecies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons'}, event='LspAttach',},
}


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
