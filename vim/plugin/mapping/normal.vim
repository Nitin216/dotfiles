" Normal mode mapping Toggle fold at current position
nnoremap <Tab> za

nnoremap <F6> <C-i>

"Avoid unitentional switches to Ex mode.
nnoremap Q <nop>

noremap Y y$

" mapping jk to gj and gk"
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Mapping if movement in buffers
nnoremap <silent><C-J> <C-W><C-J>
nnoremap <silent><C-K> <C-W><C-K>
nnoremap <silent><C-L> <C-W><C-L>
nnoremap <silent><C-H> <C-W><C-H>

" Store relative line number jumps in the jumplist if they exceed a threshold.
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : '') . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : '') . 'j'

" Mapping split width increase and decrease
nnoremap ,+ :vertical resize +5<CR>
nnoremap ,- :vertical resize -5<CR>
