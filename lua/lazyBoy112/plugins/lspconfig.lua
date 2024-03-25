
local status, lspconfig = pcall(require, 'lspconfig')
if not status then return end

local sta_cmp, cmp = pcall(require, 'cmp')
if sta_cmp then
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local servers = {
  -- 'clangd',
}

lspconfig.lua_ls.setup {
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/lazyBoy112/.luarc.json') and not vim.loop.fs_stat(path..'/lazyBoy112/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
            -- library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    return true
  end
}

lspconfig.clangd.setup{
  cmd = {
  "clangd",
  "--query-driver='C:/Espressif/tools/xtensa-esp32-elf/esp-12.2.0_20230208/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc'",
  },
  filetypes = {"c", "cpp"},
  capabilities = capabilities,
}


  for _, server in ipairs(servers) do
    lspconfig[server].setup {
      capabilities = capabilities,
    }
  end
end

local signs = { Error='E', Warn='W', Hint='H', Info='I'}
for type, icon in pairs(signs) do
  local hl = 'LspSign'..type
  vim.fn.sign_define(hl, { text=icon, texthl=hl, numhl=hl})
end
