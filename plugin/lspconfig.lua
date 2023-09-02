local status_lsp, lspconfig = pcall(require, 'lspconfig')
if not status_lsp then return end

-- Finder o: toggle expand, s: vsplit, i: split, <C-c>k: close

vim.diagnostic.config({
  virtual_text = false
})
-- vim.diagnostic.config({
--   virtual_text = {
--     prefix = '●',
--   },
--   severity_sort = true,
--   float = {
--     source = 'always',
--   }
-- })

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false
      },
    }
  }
}

-- Lsp no config
local servers = {
  'jedi_language_server',
  'clangd',
}

for _, server in ipairs(servers) do
  lspconfig[server].setup {
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern('.git'),
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  }
end

local signs = { Error = "", Warn = "", Hint = "", Info = "󰰄" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
