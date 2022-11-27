local cb_status, cb = pcall(require, 'colorbuddy')
if (not cb_status) then
  print('Error while loading colorbuddy [after/plugin/theme.lua]')
  return
end


local Color, colors, Group, groups, styles = cb.setup()
-- cb.colorscheme('cobalt2')
-- cb.colorscheme('kanagawa')
require('nightfox').setup({
  options = {
    styles = {
      comments = "italic",
      keywords = "bold",
      types = "italic,bold",
    }
  }
})
cb.colorscheme('nightfox')
local palette = require('nightfox.palette').load("nightfox")
local spec = require('nightfox.spec').load("nightfox")

vim.highlight.create('NormalFloat', { guibg = spec.bg1 }, false)
vim.highlight.create('LspFloatWinNormal', { guibg = spec.bg1 }, false)
vim.highlight.create('LspFloatWinBorder', { guibg = spec.bg1 }, false)
vim.highlight.create('Pmenu', { guibg = spec.bg1 }, false)
vim.highlight.create('CmpBorder', { guibg = spec.bg1 }, false)
