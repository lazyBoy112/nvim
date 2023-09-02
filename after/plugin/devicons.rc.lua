local status, devicon = pcall(require, 'nvim-web-devicons')
if not status then return end

devicon.setup{}
