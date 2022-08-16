local status, saga = pcall(require, 'lspsaga')
if (not status) then
  print('Error while loading lspsaga [after/plugin/lspsaga.lua]')
  return
end

local map = require('utils').map

saga.init_lsp_saga({
  finder_action_keys = {
    open = 'o',
    vsplit = 'v',
    split = 'h',
    quit = { 'q', 'e' },
    scroll_up = '<C-f>',
    scroll_down = '<C-d>',
  },
})

map('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>')
map('n', ']d', ':Lspsaga diagnostic_jump_next<CR>')
map('n', 'gh', ':Lspsaga hover_doc<CR>')
map('n', 'gd', ':Lspsaga lsp_finder<CR>')
map('n', 'gk', ':Lspsaga signature_help<CR>')
map('n', 'gp', ':Lspsaga preview_definition<CR>')
map('n', 'gr', ':Lspsaga rename<CR>')
map('n', 'gl', ':Lspsaga show_line_diagnostics<CR>')

