scriptencoding utf-8

if has('autocmd')
  function! s:NcAutocmds()
    augroup NcAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="

        autocmd InsertEnter * lua require'nc.autocmds'.insert_enter()
        autocmd InsertLeave * lua require'nc.autocmds'.insert_leave()
        autocmd VimEnter * lua require'nc.autocmds'.vim_enter()
        autocmd GUIEnter * lua require'nc.autocmds'.win_new()
        autocmd WinEnter * lua require'nc.autocmds'.vim_enter()
        autocmd WinLeave * lua require'nc.autocmds'.win_leave()

      if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua return require'vim.highlight'.on_yank{'Substitute', 150, true}
      endif
    augroup END
  endfunction

  call s:NcAutocmds()
endif
"
