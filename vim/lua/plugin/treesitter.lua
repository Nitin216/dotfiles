local ts_debugging = false

if ts_debugging then
  RELOAD('nvim-treesitter')
end

-- Mapping of user defined captures to highlight groups
-- local custom_captures = {
--   -- highlight own capure @foo.bar with highlight group "Identifier"
--   ['foo.bar'] = 'Identifier',
--   ['function.call'] = 'LuaFunctionCall',
--   ['function.bracket'] = 'Type',

--   ['namespace.type'] = 'TSNamespaceType'
-- }

-- local enabled = true

-- local read_query = function(filename)
--   return table.concat(vim.fn.readfile(vim.fn.expand(filename)), "\n")
-- end

require('nvim-treesitter.configs').setup {
  ensure_installed = { 'query', 'lua', 'tsx', 'typescript'}
}

