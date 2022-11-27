local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then
  print('Error while loadding treesitter [after/plugin/treesitter.lua]')
  return
end

ts.setup({
  ensure_installed = {
    'tsx', 'lua', 'json', 'css', 'astro'
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
})
