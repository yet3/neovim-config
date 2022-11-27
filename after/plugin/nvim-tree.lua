local status, tree = pcall(require, 'nvim-tree')
if (not status) then
  print('Error while loading nvim-tree [after/plugin/nvim-tree.lua]')
  return
end

local map = require('utils').map
local utils = require("nvim-tree.utils")
local symbols = require('ui.symbols')

local function notify_level(level)
  return function (msg)
    if level == vim.log.levels.ERROR then
      vim.notify(msg, level) 
    end 
  end
end

utils.notify.warn = notify_level(vim.log.levels.WARN)
utils.notify.error = notify_level(vim.log.levels.ERROR)
utils.notify.info = notify_level(vim.log.levels.INFO)
utils.notify.debug = notify_level(vim.log.levels.DEBUG)

tree.setup({
  view = {
    side = 'right',
    adaptive_size = true,
    width = 40,
    mappings = {
      list = {
        { key = "v", action = "vsplit" },
        { key = "h", action = "split" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = symbols.hint,
      info = symbols.info,
      warning = symbols.warn,
      error = symbols.error
    }
  }
})

map("n", "<LEADER>m", ":NvimTreeFindFile<CR>")
map("n", "<LEADER>n", ":NvimTreeToggle<CR>")
map("n", "<C-n>", ":NvimTreeFocus<CR>")
