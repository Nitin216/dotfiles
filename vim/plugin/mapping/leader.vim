" Leader mapping
"
" <Leader><Leader> open last buffer
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>o :only<CR>

nnoremap <Leader>r :call nc#mapping#leader#cycle_numbering()<CR>

nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" <Leader>pr for practice using VimBeGood
nnoremap <Leader>pr ggdG:VimBeGood<CR>

nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w: write<CR>
nnoremap <Leader>x :xit<CR>

" Mapping of buffer movement
nnoremap <silent><leader>l :bnext<CR>
nnoremap <silent><leader>h :bprevious<CR>

" Mapping of creating splits
nnoremap <silent><leader><bar> :vsplit<CR>
nnoremap <silent><leader>- :split<CR>

" Mapping split width increase and decrease
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" Mapping vim-commentary
nnoremap <silent><leader>c :Commentary<CR>
