local status, lsp = pcall(require, 'lspconfig')
if (not status) then
  print('Error while loading lspconfig [after/plugin/lspconfig.lua]')
  return
end

local status2, mason_lsp = pcall(require, 'mason-lspconfig')
if (not status2) then
  print('Error while loading mason [after/plugin/mason.lua]')
  return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.keymap.set("n", "go", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gv", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "<LEADER>p", vim.lsp.buf.formatting_seq_sync, opts)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

local capabilities = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)


mason_lsp.setup({
  ensure_installed = { 'sumneko_lua', 'tsserver', 'tailwindcss', 'cssls', 'jsonls', 'html', 'remark_ls', 'astro', 'volar',
    'lemminx', 'yamlls', 'taplo' }
})

local servers = mason_lsp.get_installed_servers()
for _, name in pairs(servers) do
  local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  local config_status, config = pcall(require, 'servers_configs.' .. name)
  if (config_status) then
    opts = vim.tbl_deep_extend('force', config or {}, opts)
  end

  lsp[name].setup(opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local symbols = require('ui.symbols')
local signs = {
  Error = symbols.with_space.error,
  Warn = symbols.with_space.warn,
  Hint = symbols.with_space.hint,
  Info = symbols.with_space.info
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
