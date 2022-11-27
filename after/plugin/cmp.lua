local status, cmp = pcall(require, 'cmp')
if (not status) then
  print('Error while loading cmp [after/plugin/cmp.lua]')
  return
end

local lspkind = require('lspkind')

local get_win_border = function(hi)
  if hi == nil then hi = 'CmpBorder' end
  return {
    { "╭", hi },
    { "─", hi },
    { "╮", hi },
    { "│", hi },
    { "╯", hi },
    { "─", hi },
    { "╰", hi },
    { "│", hi },
  }
end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<Esc>"] = cmp.mapping(function()
      cmp.mapping.abort()
      vim.cmd('stopinsert')
    end),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' }
  }),
  formatting = {
    --[[ format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }) ]]
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu",
      border = get_win_border(),
      col_offset = -3,
      side_padding = 0
    },
    documentation = {
      border = get_win_border(),
    }
    --[[ documentation = cmp.config.window.bordered({ ]]
    --[[   border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' }, ]]
    --[[ }) ]]
  }
})


vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]
