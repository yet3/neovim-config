local cb_status, cb = pcall(require, 'colorbuddy')
if (not cb_status) then
  print('Error while loading colorbuddy [after/plugin/theme.lua]')
  return
end


local Color, colors, Group, groups, styles = cb.setup()
cb.colorscheme('cobalt2')


