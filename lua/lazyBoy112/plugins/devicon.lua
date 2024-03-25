local status, devicon = pcall(require, 'nvim-web-devicon')
if not status then return end

devicon.setup({
  override = {},
  default = true,
  override_by_filename = {},
  override_by_extension = {},
})
