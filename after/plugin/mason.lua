local status, mason = pcall(require, 'mason')
if (not status) then
  print('Error while loading mason [after/plugin/mason.lua]')
  return
end


mason.setup()
