scriptencoding utf-8

if has('autocmd')
  function! s:NcAutocmds()
    augroup NcAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

      autocmd InsertLeave * set nopaste
      
      if exists('+colorcolumn') &&
              \ exists('+winhighlight') &&
              \ has('conceal') &&
              \ has('folding') &&
              \ has('mksession') &&
              \ has('statusline') &&
              \ has('nvim')
        
        autocmd BufEnter * lua require'nc.autocmds'.buf_enter()
        " autocmd BufLeave * lua require'nc.autocmds'.mkview()
        " autocmd BufWinEnter ?* lua require'nc.autocmds'.loadview()
        autocmd BufWritePost ?* lua require'nc.autocmds'.mkview()
        autocmd FocusGained * lua require'nc.autocmds'.focus_gained()
        autocmd FocusLost * lua require'nc.autocmds'.focus_lost()
        autocmd InsertEnter * lua require'nc.autocmds'.insert_enter()
        autocmd InsertLeave * lua require'nc.autocmds'.insert_leave()
        autocmd VimEnter * lua require'nc.autocmds'.vim_enter()
        autocmd WinEnter * lua require'nc.autocmds'.vim_enter()
        autocmd WinLeave * lua require'nc.autocmds'.win_leave()
      endif

      autocmd BufWritePost */spell/*.add silent! :mkspell! %
      
      if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua return require'vim.highlight'.on_yank{'Substitute', 200}
      endif
    augroup END
  endfunction

  call s:NcAutocmds()


  " Wait until  idle to run additional "boot" commands.
  augroup NcIdleboot
    autocmd!
    if has('vim_starting')
      autocmd CursorHold,CursorHoldI * call nc#autocmds#idleboot()
    endif
  augroup END
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
          \ 		'cursorline': &cursorline,
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

  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
endif
