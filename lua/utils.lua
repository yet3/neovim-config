local Utils = { }

function Utils.map(m,l,r,o)
  local opts = { silent = true, noremap = true }
  if o then
    opts = vim.tbl_deep_extend('force', opts, o)
  end

  vim.keymap.set(m, l, r, opts)
end

function Utils.has(a)
  return vim.fn.has(a) == 1
end

Utils.is_mac = Utils.has('macunix')
Utils.is_win = Utils.has('win32')

return Utils
