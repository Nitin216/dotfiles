augroup NcDirvish
  autocmd!
  autocmd FileType dirvish 
         \ silent! nnoremap <nowait><buffer><silent> o :<C-U>.call dirvish#open('edit', 0)<CR>
  autocmd FileType dirvish setlocal colorcolumn=
augroup END
