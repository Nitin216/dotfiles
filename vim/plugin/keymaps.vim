nnoremap <leader>x :call nc#executor()<CR>
nnoremap <leader><leader>x :call nc#save_and_exec()<CR>

nnoremap j <cmd>call nc#jump_direction('j')<CR>
nnoremap k <cmd>call nc#jump_direction('k')<CR>


nnoremap <silent> gj :let _=&lazyredraw<CR>:set lazyredraw<CR>/\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>
nnoremap <silent> gk :let _=&lazyredraw<CR>:set lazyredraw<CR>?\%<C-R>=virtcol(".")<CR>v\S<CR>:nohl<CR>:let &lazyredraw=_<CR>

" Run the last command
nnoremap <leader><leader>c :<up>

" Making windows to be basically same size
nnoremap <leader>= <C-w>=

"Sizing window horizontally
nnoremap <C-,> <C-w><
nnoremap <C-.> <C-w>>

" nnoremap <A-,> <C-W>5<
nnoremap ≤ <C-W>5<
nnoremap ≥ <C-W>5>

" Sizing window vertically
" taller
" nnoremap <A-t> <C-w>+
nnoremap † <C-w>+
"shorter
" nnoremap <A-s> <C-w>-
nnoremap ß <C-w>-

" Helpful delete/change into blackhole buffer
nmap <leader>d "_d
nmap <leader>c "_c

nnoremap <expr> <CR> {-> v:hlsearch ? "nohl\<CR>" : "\<CR>"}()
nnoremap <M-CR> :let v:hlsearch=!v:hlsearch<CR>

