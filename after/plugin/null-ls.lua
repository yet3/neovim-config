local status, nls = pcall(require, 'null-ls')
if (not status) then
  print('Error while loading null-ls [after/plugin/null-ls.lua]')
  return
end

local formatting = nls.builtins.formatting
local diagnostics = nls.builtins.formatting

nls.setup({
  debug = false,
  sources = {
    -- formatters
    formatting.prettierd,
    formatting.stylua,

    -- linters
    diagnostics.eslint_d,
  },
})
