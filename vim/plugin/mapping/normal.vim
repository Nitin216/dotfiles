" Normal mode mapping Toggle fold at current position
nnoremap <Tab> za

nnoremap <F6> <C-i>

"Avoid unitentional switches to Ex mode.
nnoremap Q <nop>

inoremap jk <esc>

noremap Y y$

" mapping jk to gj and gk"
" nnoremap j gj
" nnoremap gj j
" nnoremap k gk
" nnoremap gk k

nnoremap gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" nnoremap <leader><leader>c :<up>

nnoremap <leader>= <C-w>=
" Mapping if movement in buffers
nnoremap <silent><C-J> <C-W><C-J>
nnoremap <silent><C-K> <C-W><C-K>
nnoremap <silent><C-L> <C-W><C-L>
nnoremap <silent><C-H> <C-W><C-H>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" Mapping split width increase and decrease
" nnoremap ,+ :vertical resize +5<CR>
" nnoremap ,- :vertical resize -5<CR>

" Copied from tj to remove all the hlsearch
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" Change the current word in insertmode.
" Auto places you into the spot where you can start typing to change it.
nnoremap <C-r>w :%s/<c-r><c-w>//g<left><left>

