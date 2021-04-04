local icons = require('nvim-nonicons')

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_auto_ignore_ft = { 'startify', 'dashboard' }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_icons = {
  default = icons.get('file'),
  folder = {
    default = icons.get('file-directory'),
    open = icons.get('file-directory-outline'),
    symlink = icons.get('file-symlink-file'),
    empty = icons.get('file-directory-outline'),
    empty_open = icons.get('file-directory-outline'),
  },
}

vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
}

vim.cmd [[
  nnoremap <silent><leader><leader>t :NvimTreeToggle<CR>
  nnoremap <silent><leader><leader>r :NvimTreeRefresh<CR>
]]

