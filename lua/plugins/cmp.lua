return {
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',

  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'enter' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'normal'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = {
      --accept = { auto_brackets = { enable = false } },
      documentation = { auto_show = false },
      menu = {
        --enable = true,
        border = "rounded",
        -- draw = {
        --   columns = function ()
        --     if vim.api.nvim_get_mode().mode == 'c' then
        --       return { { 'label', gap = 1 } }
        --     else
        --       return { { 'kind_icon', 'label', 'source_name', gap = 1 } }
        --     end
        --   end
        -- }
        draw = {
          columns = function ()
            if vim.api.nvim_get_mode().mode == 'c' then
              return { { 'label', gap=1 } }
            else
              return { { 'label', gap=1 }, { 'kind_icon' }, { 'source_name' } }
            end
          end

        }
      },
      ghost_text = { enabled = true }
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
  -- config = function ()
  --   local capabilities = vim.lsp.protocol.make_client_capabilities()

  --   capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities({}, false))

  --   capabilities = vim.tbl_deep_extend('force', capabilities, {
  --     textDocument = {
  --       foldingRange = {
  --         dynamicRegistration = false,
  --         lineFoldingOnly = true
  --       }
  --     }
  --   })
  --   vim.lsp.config('*', {
  --     root_markers = { '.git' },
  --     capabilities = capabilities
  --   })
  -- end
}
