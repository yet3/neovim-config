vim.filetype.add({
  extension = {
    astro = "astro",
  },
})

vim.g.mapleader = ' '
require('base')
require('plugins')
require('commands')
require('maps')
