" Normal mode mapping Toggle fold at current position
nnoremap <Tab> za

nnoremap <F6> <C-i>

"Avoid unitentional switches to Ex mode.
nnoremap Q <nop>

inoremap jk <esc>
inoremap <esc> <nop>
inoremap <up> <nop>

noremap Y y$

" noremap j gj
" noremap k gk

nnoremap <leader>= <C-w>=

" Mapping if movement in buffers
nnoremap <silent><C-j> <C-w>j
nnoremap <silent><C-k> <C-w>k
nnoremap <silent><C-l> <C-w>l
nnoremap <silent><C-h> <C-w>h

"Moving buffers
" nnoremap <silent><C-J> <C-w>J
" nnoremap <silent><C-K> <C-w>K
" nnoremap <silent><C-L> <C-w>L
" nnoremap <silent><C-H> <C-w>H
"
" Move through quickfix things easily
nnoremap <silent><C-b> :cnext<CR>
nnoremap <silent><C-y> :cprev<CR>

 " Store relative line number jumps in the jumplist if they exceed a threshold.
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" Mapping split width increase and decrease
nnoremap <silent>“ :vertical resize +1<CR>
nnoremap <silent>‘ :vertical resize -1<CR>
nnoremap <silent>¥ :resize +1<CR>
nnoremap <silent>∫ :resize -1<CR>

" Copied from tj to remove all the hlsearch
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

" Change the current word in insertmode.
" Auto places you into the spot where you can start typing to change it.
nnoremap <space><space>r :%s/<c-r><c-w>//g<left><left>

