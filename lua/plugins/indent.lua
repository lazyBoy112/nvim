return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function ()
    require'ibl'.setup {
      indent = {
        char = '▏',
        highlight = 'NonText',
        smart_indent_cap = true,
        priority = 2,
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        include = {
          node_type = {
            ['*'] = { '*' }
          }
        },
        show_start = false,
        show_end = false,
        highlight = 'Function',
        priority = 1,
      },
    }
  end
}
