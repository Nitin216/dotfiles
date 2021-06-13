" leader mapping

nnoremap <silent><leader>q :quit<CR>
nnoremap <silent><leader>w :write<CR>
nnoremap <silent><leader>Y gg"+yG
nnoremap <silent><leader>y "+y
vnoremap <silent><leader>y "+y
nnoremap <silent><leader>v v$

xnoremap p "_dP

" Mapping of buffer movement
" nnoremap <silent><leader>l :bnext<CR>
" nnoremap <silent><leader>h :bprevious<CR

" Mapping of creating splits
nnoremap <silent><leader>\ :vnew<CR>
nnoremap <silent><leader>- :new<CR>

"Mapping Undotree
nnoremap <silent><leader>u :UndotreeToggle<CR> :UndotreeFocus<CR>

" Mapping tab navigation
nnoremap <silent><c-t> :tabnew<CR>
nnoremap <silent><leader>l :tabnext<CR>
nnoremap <silent><leader>h :tabprev<CR>

nnoremap <M-CR> :let v:hlsearch=!v:hlsearch<CR>
" Mapping Symbols outline
nnoremap <silent><leader>o :SymbolsOutline<CR>
" Mapping Terminal  
nnoremap <silent><leader><leader>t :terminal<CR>
