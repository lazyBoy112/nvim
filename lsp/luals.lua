local runtime_path = vim.split
return {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.git/' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
			},
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					vim.fn.stdpath('config'),
				},
			}
		},
	},
}
