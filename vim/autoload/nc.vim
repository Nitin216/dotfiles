if !exists('*nc#save_and_exec')
  function! nc#save_and_exec() abort
    if &filetype == 'vim'
      :silent! write
      :source %
    elseif &filetype == 'lua'
      :silent! write
      :luafile %
    endif

    return
  endfunction
endif

if !exists('*nc#executor')
  function! s:executor() abort
    if &ft == 'lua'
      call execute(printf(":lua %s", getline(".")))
    elseif &ft == 'vim'
      exe getline(">")
    endif
  endfunction
endif

" Does:
"   For wrapped lines, does gj/gk
"   For large jumps, adds a spot on the jump list
function! nc#jump_direction(letter)
  let jump_count = v:count

  if jump_count == 0
    call execute(printf('normal! g%s', a:letter))
    return
  endif

  if jump_count > 5
    call execute("normal! m'")
  endif

  call execute(printf('normal! %d%s', jump_count, a:letter))
endfunction
