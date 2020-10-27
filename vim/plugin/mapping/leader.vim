" leader mapping
"
" <leader><leader> open last buffer
nnoremap <leader><leader> <C-^>

nnoremap <leader>o :only<CR>

nnoremap <leader>r :call nc#mapping#leader#cycle_numbering()<CR>

" Sourcing vimrc
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" <leader>pr for practice using VimBeGood
nnoremap <leader>pr ggdG:VimBeGood<CR>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>x :xit<CR>

" Mapping of buffer movement
nnoremap <silent><leader>l :bnext<CR>
nnoremap <silent><leader>h :bprevious<CR>

" Mapping of creating splits
nnoremap <silent><leader><bar> :vsplit<CR>
nnoremap <silent><leader>- :split<CR>

" Mapping vim-commentary
nnoremap <silent><leader>c :Commentary<CR>

" Mapping tab navigation
nnoremap <silent><leader>nt :tabnext<CR>
nnoremap <silent><leader>pt :tabprev<CR>

" Fzf mapping
nnoremap <silent><leader>gf :GitFiles<CR>
nnoremap <silent><leader>af :Files<CR>
nnoremap <silent><leader>hh :Help<CR>
nnoremap <silent><leader>f :Rg<CR>
