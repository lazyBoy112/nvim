local status, ls = pcall(require, 'luasnip')
if not status then return end

local map = vim.keymap.set

-- map({'i'}, '<C-K>', function() ls.expand() end, {silent = true})
-- map({'i', 's'}, '<tab>l', function() ls.jump( 1) end, {silent = true})
-- map({'i', 's'}, '<tab>h', function() ls.jump(-1) end, {silent = true})
--
-- map({'i', 's'}, '<C-l>', function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, {silent = true})

require('luasnip.loaders.from_vscode').lazy_load()
