" let g:nvim_tree_side = 'left' "left by default
" let g:nvim_tree_width = 40 "30 by default
" let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
" let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
" let g:nvim_tree_auto_ignore_ft = ['startify', 'dashboard'] "empty by default, don't auto open tree on specific filetypes.
" let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
" let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
" let g:nvim_tree_show_icons = {
"     \ 'git': 1,
"     \ 'folders': 1,
"     \ 'files': 1,
"     \ }

" let g:nvim_tree_icons = {
"     \ 'default': '',
"     \ 'symlink': '',
"     \ 'git': {
"     \   'unstaged' : '◉',
"     \   'staged'   : '✚',
"     \   'untracked': '◈',
"     \   'renamed'  : '➜',
"     \   'unmerged' : '═'
"     \   },
"     \ 'folder': {
"     \   'default': "",
"     \   'open': "",
"     \   'symlink': "",
"     \   }
"     \ }

" nnoremap <silent><leader><leader>t :NvimTreeToggle<CR>
" nnoremap <silent><leader>r :NvimTreeRefresh<CR>
" nnoremap <silent><leader>tf :NvimTreeFindFile<CR>
