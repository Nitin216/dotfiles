
if require('nc.first_load')() then
  return
end

vim.g.mapleader = ' '

-- Setup globals
require('nc.globals')

-- Setup plugins
-- Load packer.nvim files
require('nc.plugins')

-- Force loading of astronauta first
vim.cmd [[runtime plugin/astronauta.vim]]

-- Load neovim options
require('nc.options')

-- -- Setting up custom statusline
-- require('nc.statusline')

-- Neovim builtin lsp configuration
require('nc.lsp')

-- Telescope configuration
require('nc.telescope')
require('nc.telescope.mappings')
