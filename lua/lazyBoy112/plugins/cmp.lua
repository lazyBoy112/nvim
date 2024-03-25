local status, cmp = pcall(require, 'cmp')
if not status then return end
local luasnip = require 'luasnip'
local has_words_before = function ()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
end

local opts = {
  formatting = {
    format = function(entry, vim_item)
        local lspkind_icons = {
            Text = '󰊄',
            Method = '',
            Function = '󰡱',
            Constructor = '',
            Field = '',
            Variable = '󰫧',
            Class = '',
            Interface = '',
            Module = '󰕳',
            Property = '',
            Unit = '󰓼',
            Value = '',
            Enum = '',
            Keyword = '',
            Snippet = '󰅴',
            Color = '',
            File = '',
            Reference = '',
            Folder = '',
            EnumMember = '',
            Constant = '󰏿',
            Struct = '󰰡',
            Event = '',
            Operator = '',
            TypeParameter = ''
        }
        -- load lspkind icons
        vim_item.kind = string.format('%s %s', lspkind_icons[vim_item.kind], string.sub(vim_item.kind, 1, 4))
        -- vim_item.kind = string.format('%s', lspkind_icons[vim_item.kind])
        vim_item.abbr = string.sub(vim_item.abbr, 1, 15)

        vim_item.menu = ({
            luasnip = '[snip]',
            path = '[path]',
            buffer = '[BUF]',
            -- calc = '[CALC]',
            -- nuspell = '[SPELL]',
            spell = '[spell]',
            emoji = '[emo]',
            -- treesitter = '[TS]',
            nvim_lsp = '[lsp]',
            -- cmp_tabnine = '[TN]',
            latex_symbols = '[latex]',
            -- tmux = '[TMUX]',
            -- conjure = '[CJ]',
            orgmode = '[org]'
        })[entry.source.name]
        return vim_item
    end
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        -- elseif has_words_before() then
        --   cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),


    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<C-y>'] = cmp.mapping.confirm({ select=true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }),
  experimental = {
    ghost_text = true,
  },
}

cmp.setup(opts)
