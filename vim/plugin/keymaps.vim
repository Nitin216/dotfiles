function! s:executor() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(">")
  endif
endfunction

nnoremap <leader>x :call <SID>executor()<CR>

function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif
endfunction

nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>

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

