local status, term = pcall(require, 'toggleterm')
if (not status) then
  print('Error while loading toggleterm [after/plugin/toggleterm.lua]')
  return
end

term.setup({
  open_mapping = [[<C-\>]],
  direction = "float",
  float_opts = {
    border = "single",
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end


