--[[
local status, prettier = pcall(require, 'prettier')
if (not status) then
  print('Error while loading prettier [after/plugin/prettier.lua]')
  return
end

prettier.setup({
  bin = 'prettierd'
})
--]]
