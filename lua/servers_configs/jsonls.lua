local status, schemastore = pcall(require, 'schemastore')
if (not status) then
  print('Error while loading lsp server config schemastore [lua/servers_configs/jsonls.lua]')
  return {}
end

return {
  settings = {
    json = {
      schemas = schemastore.json.schemas(),
      validate = { enable = true },
    },
  }
}
