let g:NcMkviewFileTypeBlacklist = ['diff', 'gitcommit']

function! nc#autocmds#attempt_selected_last_file() abort
  let l:previous=expand("#:t")
  if l:previous !=# ''
    call search('\v<' . l:previous . '>')
  endif
endfunction

function! nc#autocmds#idleboot() abort
  " Make sure we automatically call nc#autocmds#idleboot() only once.
  augroup NcIdleBoot
    autocmd!
  augroup END

  " Make sure we run deferred tasks exactly once.
  doautocmd User NcDefer
  autocmd! User NcDefer
endfunction

function! nc#autocmds#should_winhighlight() abort
  return &filetype!='dirvish'
endfunction	

function! nc#autocmds#format(motion) abort
  if has('ex_extra')
    let l:v=operator#user#visual_command_from_wise_name(a:name)
    silent execute 'normal!' '`[' . l:v . '`]gq'
    '[,']retab!
  endif
endfunction
