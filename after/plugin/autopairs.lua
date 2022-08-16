local status, ap = pcall(require, 'nvim-autopairs')
if (not status) then
  print('Error while loading nvim-autopairs [after/plugin/autopairs.lua]')
  return
end

ap.setup({
  disable_filetype = { 'TelescopePrompt' }
})

