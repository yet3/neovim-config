local map = require('utils').map

-- Change word under the cursor
-- move to next/prev instance by using n/N
-- replace next/prev instance by using .
map('n', '<LEADER>x', '*``cgn')

-- Toggle spell checking
map('n', '<F2>', ':set spell!<CR>')
map('i', '<F2>', ':set spell!<CR>')

-- Inc/Dec number under cursor
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- Window splits
map('n', '<C-v>', ':vsplit<CR>')
map('n', '<C-s>', ':split<CR>')

-- Moving between splits
map('n', '<C-w>', '<C-w>w')
map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')

-- Rotating splits
map('n', '<C-R>', '<C-w>R')
map('n', '<C-r>', '<C-w>r')

-- Resizing splits
map('n', '<C-S-l>', ':vertical resize +5<CR>')
map('n', '<C-S-h>', ':vertical resize -5<CR>')
map('n', '<C-S-j>', ':resize +5<CR>')
map('n', '<C-S-k>', ':resize -5<CR>')

-- Keep visual mode after changing indent
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Moving lines
map('n', 'J', ':m+1<CR>')
map('n', 'K', ':m-2<CR>')
map("v", "J", ":m'>+<CR>gv")
map('v', 'K', ':m-2<CR>gv')

-- Switching Buffers
map('n', '<Tab>', ':bn<CR>')
map('n', '<S-Tab>', ':bp<CR>')
map('n', '<LEADER>;', '<C-6>')

-- Select entire file
map('n', '<C-a>', 'ggVG')
map('i', '<C-a>', '<Esc>ggVG')

map("n", "d", '"_d') -- Dont't save to clipboard on d
map("n", "c", '"_c') -- Dont' save to clipboard on c 
map("n", "X", "dd") -- Cut line on Shift+x
