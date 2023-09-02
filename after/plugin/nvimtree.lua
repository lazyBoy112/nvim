local status, nvimtree = pcall(require, 'nvim-tree')
if not status then return end

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
  -- default mappings
  api.config.mappings.default_on_attach(bufnr)
  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('info'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('vertical_open'))
  vim.keymap.set('n', '.', api.node.run.cmd, opts('run_command'))
  vim.keymap.set('n', 'a', api.fs.create, opts('create_file'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('remove'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('rename'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('reload'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('create_file'))
  vim.keymap.set('n', ']c', api.node.navigate.git.prev, opts('prev_git'))
  vim.keymap.set('n', '[c', api.node.navigate.git.next, opts('next_git'))
end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    highlight_opened_files = '',
    icons = {
      web_devicons = {
        file = {
          enable = true,
          color = true
        },
        folder = {
          enable = true,
          color = true
        }
      }
    },
    special_files = {'Makefile', 'readme.md'}
  },
  filters = {
    dotfiles = false
  },
  on_attach = my_on_attach,
})
