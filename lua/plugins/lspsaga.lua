return {
  'nvimdev/lspsaga.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'LspAttach',
  opts = {
    symbol_in_winbar = {
      enable = true,
      separator = '',
      hide_keyword = false,
      show_file = false,
      color_mode = true,
      delay = 500,
    },
    code_action = {
      num_shortcut = true,
      show_server_name = true,
      extend_gitsigns = true,
    },
    definition = {
      keys = {
        edit = '<c-o>',
        vsplit = '<c-v>',
        split = '<c-s>',
        tabe = '<c-t>',
        close = ''
      }
    },
    diagnostic = {
      show_code_action = true,
      keys = {
        exec_action = '<c-o>',
      },
    },
    hover = {
      keys = {
        open_link = '<c-o>',
        open_cmd = '!chrome'
      }
    },
    light_bulb = {
      enable = true,
      sign = false,
      virtual_text = true,
    },
    rename = {
      keys = {
        quit = '<c-q>',
        exec = '<cr>',
        select = 'x',
      }
    },
    finder = {
      max_height = 0.6,
      keys = {
        shuttle = '[w',
        toggle_or_open = '<c-o>',
        vsplit = '<c-v>',
        split = '<c-s>',
        tabe = '<c-t>',
        quit = 'q',
        close = '<c-c>'
      }
    },
    ui = {
      border = 'rounded',
      beacon = {
        enable = false,
      }
    }
  }
}
