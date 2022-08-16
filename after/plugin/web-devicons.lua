local status, icons = pcall(require, 'nvim-web-devicons')
if (not status) then
  print('Error while loading nvim-web-devicons [after/plugin/web-devicons.lua]')
  return
end

icons.setup({
  default = true,
  ovveride = {}
})
