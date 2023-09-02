local status, telescope = pcall(require, 'telescope')
if not status then return end

telescope.setup{
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    entry_prefix = ' ',
    multi_icon = ' ',

  }
}
