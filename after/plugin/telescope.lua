local status, telescope = pcall(require, 'telescope')
if (not status) then
  print('Error while loading telescope [after/plugin/telescope.lua]')
  return
end

local map = require('utils').map
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    file_ignore_patterns = { '%.git', 'cache', 'node_modules' },
    path_display = { 'truncate' },
    mappings = {
      n = {
        ['q'] = actions.close,
        ['o'] = actions.select_default,
        ['v'] = actions.file_vsplit,
        ['h'] = actions.file_split
      },
      i = {
        ['<C-e>'] = actions.close,
        ['<C-v>'] = actions.file_vsplit,
        ['<C-h>'] = actions.file_split
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- or 'ignore_case' or 'respect_case'
                                       -- the default case_mode is 'smart_case'
    }
  }
})

telescope.load_extension('fzf')

map('n', '<leader>f', ':Telescope find_files hidden=true<CR>')
map('n', '<leader>g', ':Telescope live_grep<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>d', ':Telescope diagnostics<CR>')
map('n', '<leader>r', ':Telescope resume<CR>')
