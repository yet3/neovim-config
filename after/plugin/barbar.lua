local status, bar = pcall(require, 'bufferline')
if (not status) then
  print('Error while loading barbar [after/plugin/barbar.lua]')
  return
end

local map = require('utils').map

bar.setup({
  animation = false,
  icons = true,
})

map('n', '<M-w>', ':BufferClose<CR>')

map('n', '<M-h>', ':BufferPrevious<CR>')
map('n', '<M-l>', ':BufferNext<CR>')

map('n', '<M-1>', ':BufferGoto 1<CR>')
map('n', '<M-2>', ':BufferGoto 2<CR>')
map('n', '<M-3>', ':BufferGoto 3<CR>')
map('n', '<M-4>', ':BufferGoto 4<CR>')
map('n', '<M-5>', ':BufferGoto 5<CR>')
map('n', '<M-6>', ':BufferGoto 6<CR>')
map('n', '<M-7>', ':BufferGoto 7<CR>')
map('n', '<M-8>', ':BufferGoto 8<CR>')
map('n', '<M-9>', ':BufferGoto 9<CR>')
map('n', '<M-0>', ':BufferLast<CR>')
