local status, lightspeed = pcall(require, 'lightspeed')
if (not status) then
  print('Error while loading lightspeed [after/plugin/lightspeed.lua]')
  return
end

lightspeed.setup({})
