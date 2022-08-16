local status, colorizer = pcall(require, 'colorizer')
if (not status) then
  print('Error while loading colorizer [after/plugin/colorizer.lua]')
  return
end

colorizer.setup({
  '*'
})
