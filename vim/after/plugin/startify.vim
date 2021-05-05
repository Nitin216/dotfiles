let g:startify_change_to_dir = 0
set buflisted

" let g:startify_disable_at_vimenter = 1

let g:startify_list_order =  [
  \ ['   Sessions'],
  \ 'sessions',
  \ ['   MRU '.getcwd()] ,
  \ 'dir',
  \ ['   MRU '],
  \ 'files',
  \['   Commands'],
  \ 'commands'
  \]
