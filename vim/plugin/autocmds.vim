scriptencoding utf-8

if has('autocmd')
  function! s:NcAutocmds()
    augroup NcAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

      " autocmd InsertLeave * set nopaste

      " if exists('+colorcolumn') &&
      "         \ exists('+winhighlight') &&
              " \ has('conceal') &&
      "         \ has('folding') &&
      "         \ has('mksession') &&
        if has('statusline') &&
              \ has('nvim')

        autocmd BufEnter * lua require'nc.autocmds'.buf_enter()
        autocmd FocusGained * lua require'nc.autocmds'.focus_gained()
        autocmd FocusLost * lua require'nc.autocmds'.focus_lost()
        autocmd InsertEnter * lua require'nc.autocmds'.insert_enter()
        autocmd InsertLeave * lua require'nc.autocmds'.insert_leave()
        autocmd VimEnter * lua require'nc.autocmds'.vim_enter()
        autocmd GUIEnter * lua require'nc.autocmds'.win_new()
        autocmd WinEnter * lua require'nc.autocmds'.vim_enter()
        autocmd WinLeave * lua require'nc.autocmds'.win_leave()
      endif

      " autocmd BufWritePost */spell/*.add silent! :mkspell! %

      if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua return require'vim.highlight'.on_yank{'Substitute', 150, true}
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

    if exists('$TMUX')
      autocmd VimleavePre * call s:EnsureTmux()
    endif
  " endfunction

  function! s:EnsureTmux()
    silent !tmux set status on
  endfunction
endif
