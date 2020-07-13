scriptencoding utf-8

if has('autocmd')
  function! s:NcAutocmds()
    augroup NcAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

      autocmd VimEnter * autocmd WinEnter * let w:created=1
      autocmd VimEnter * let w:created=1

      autocmd InsertLeave * set nopaste

      if exists('+winhighlight')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * set winhighlight=
        autocmd FocusLost,WinLeave * if nc#autocmds#should_winhighlight() | set winhighlight=CursorLineNr:LineNr,EndOfBuffer:ColorColumn,IncSearch:ColorColumn,Normal:ColorColumn,NormalNC:ColorColumn,SignColumn:ColorColumn
        if exists('+colorcolumn')
          autocmd BufEnter,FocusGained,VimEnter,WinEnter * if nc#autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(range(0, 254), ',+') | endif
        endif
      elseif exists('+colorcolumn')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * if nc#autocmds#should_colorcolumn() | let &l:colorcolumn='+' . join(0, 254), ',+') | endif
        autocmd FocusLost,WinLeave * if nc#autocmds#should_colorcolumn() | let &l:colorcolumn=join(range(1, 255), ',') | endif
      endif
      autocmd InsertLeave,VimEnter,WinEnter * if nc#autocmds#should_cursorline() | setlocal cursorline | endif
      autocmd InsertEnter,WinLeave * if nc#autocmds#should_cursorline() | setlocal nocursorline | endif
      if has('statusline')
        autocmd BufEnter,FocusGained,VimEnter,WinEnter * call nc#autocmds#focus_statusline()
        autocmd FocusLost,WinLeave * call nc#autocmds#blur_statusline()
      endif
      autocmd BufEnter,FocusGained,VimEnter,WinEnter * call nc#autocmds#focus_window()
      autocmd FocusLost,WinLeave * call nc#autocmds#blur_window()
    augroup END
  endfunction

  call s:NcAutocmds()
  "
  " Goyo
  "
  let s:matchad=v:null
  let s:settings={}

  function! s:goyo_enter()
    augroup NcAutocmds
      autocmd!
    augroup END
    augroup! NcAutocmds

    augroup NcAutocolor
      autocmd!
    augroup END
    augroup! NcAutocolor

    let s:settings = {
          \ 		'showbreak': &showbreak,
          \ 		'statusline': &statusline,
          \ 		'cursorline': &cursorline
          \ 		'showmode': &showmode
    }		

    set showbreak=
    set statusline=\
    set nocursorline
    set noshowmode

    if exists('$TMUX')
      silent !tmux set status off
    endif

    let l:nbsp=' '
    let s:matchadd=matchadd('Error', l:nbsp)

    let b:quitting=0
    let b:quitting_bang=0

    if exists('$TMUX')
      autocmd VimleavePre * call s:EnsureTmux()
    endif
  endfunction

  function! s:EnsureTmux()
    silent !tmux set status on
  endfunction

  function! s:goyo_leave()
    let l:is_last_buffer=len(filter(range(1,bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting && l:is_last_buffer
      if b:quitting_bang
        qa!
      else
        qa
      endif
    endif

    for [k,v] in items(s:settings)
      execute 'let &' . k . '=' . string(v)
    endfor

    if exists('$TMUX')
      silent !tmux set status on
    endif

    if type(s:matchadd) != type(v:null)
      try
        call matchdelete(s:matchadd)
      catch /./
      endtry
      let s:matchadd=v:null
    endif
    call s:NcAutocmds()
  endfunction

  autocmd! User GoyoEnter nester call <SID>goyo_enter()
  autocmd! User GoyoLeave nester call <SID>goyo_leave()

endif
