" leader mapping
"
" <leader><leader> open last buffer
nnoremap <leader><leader> <C-^>

nnoremap <leader>o :only<CR>

" <leader>pr for practice using VimBeGood
nnoremap <leader>pr ggdG:VimBeGood<CR>

nnoremap <leader>q :quit<CR>
nnoremap <leader>w :write<CR>
nnoremap <leader>Y gg"+yG
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" Mapping of buffer movement
" nnoremap <silent><leader>l :bnext<CR>
" nnoremap <silent><leader>h :bprevious<CR

" Mapping of creating splits
nnoremap <silent><leader><bar> :vsplit<CR>
nnoremap <silent><leader>- :split<CR>

" Mapping tab navigation
nnoremap <silent><c-t> :tabnew<CR>
nnoremap <silent><leader>tn :tabnext<CR>
nnoremap <silent><leader>tp :tabprev<CR>

" Fzf mapping
nnoremap <leader>gf :GitFiles<CR>
nnoremap <leader>nf :Files<CR>
nnoremap <leader>ff :Rg<CR>

nnoremap <M-CR> :let v:hlsearch=!v:hlsearch<CR>

