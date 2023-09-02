local status, cmp = pcall(require, 'cmp')
if not status then return end


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
        vim_item.kind = string.format('%s %s', lspkind_icons[vim_item.kind], vim_item.kind)
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
    ['<tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end
    ),
    ['<S-tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
    ),
    ['<CR>'] = cmp.mapping.confirm({ select=true }),
    ['<C-space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
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
