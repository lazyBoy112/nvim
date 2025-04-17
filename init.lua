-- # pretty print object with neovim is vim.inspect
if vim.g.vscode then
  print()
end

require 'core.utils.options'.setup()
require 'core.utils.mappings'.setup()

-- check git
if vim.fn.executable('git') ~= 1 then
	vim.notify("git is not install?? Install git first!")
end


-- init lazy nvim
require "core.manager.lazy"

vim.lsp.enable('luals')
vim.keymap.set({ 'i' }, '<C-Space>', function() vim.lsp.completion.get() end, {})
vim.keymap.set({ 'n' }, '<S-S>', function() print('key press') end, {})

-- vim.o.completeopt = "menu,noinsert,popup,fuzzy"
local theme = require 'core.utils.theme'
theme.setup()




-- vim.api.nvim_create_autocmd('LspAttach', {
-- 	group = vim.api.nvim_create_augroup('my.lsp', {}),
-- 	callback = function(args)
-- 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
-- 		if client:supports_method('textDocument/completion') then
-- 			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
-- 			client.server_capabilities.completionProvider.triggerCharacters = vim.split("qwertyuiopasdfghjklzxcvbnm. ", "")
-- 			vim.lsp.completion.enable(true, client.id, args.buf, {
-- 				autotrigger = true,
-- 				convert = function(item)
-- 					return { abbr = item.label:gsub('%b()', '') }
-- 				end
-- 			})
-- 			end
-- 	end,
-- })

vim.diagnostic.config({
	virtual_lines = true,
})
require'core.utils.statusline'
require'core.utils.bufferline'.setup()
vim.api.nvim_set_hl(0, 'TabLineSel', {fg='#ff0000', bg='#00ff00', sp='#0000ff', bold=true, underline=true })
