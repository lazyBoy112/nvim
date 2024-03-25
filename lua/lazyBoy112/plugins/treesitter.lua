local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then return end

ts.setup({
	ensure_installed = {},
	sync_install = true,
	auto_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {}, -- 'c'
		additional_vim_regex_highlighting = false,
	},
})
