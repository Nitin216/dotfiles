" Leader mapping
"
" <Leader><Leader> open last buffer
nnoremap <Leader><Leader> <C-^>

nnoremap <Leader>o :only<CR>

nnoremap <Leader>r :call nc#mapping#leader#cycle_numbering()<CR>

" Sourcing vimrc
nnoremap <silent><leader>sv :source $MYVIMRC<cr>

" <Leader>pr for practice using VimBeGood
nnoremap <Leader>pr ggdG:VimBeGood<CR>

nnoremap <Leader>q :quit<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>

" Mapping of buffer movement
nnoremap <silent><leader>l :bnext<CR>
nnoremap <silent><leader>h :bprevious<CR>

" Mapping of creating splits
nnoremap <silent><leader><bar> :vsplit<CR>
nnoremap <silent><leader>- :split<CR>

" Mapping split width increase and decrease
nnoremap <C-+> :vertical resize +5<CR>
nnoremap <C--> :vertical resize -5<CR>

" Mapping vim-commentary
nnoremap <silent><leader>c :Commentary<CR>

" Mapping tab navigation
nnoremap <silent><leader>nt :tabnext<CR>
nnoremap <silent><leader>ptT:tabprev<CR>

" Fzf mapping
nnoremap <silent><leader>gf :GitFiles<CR>
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>hh :Help<CR>
nnoremap <silent><leader>f :Rg<CR>
