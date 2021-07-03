scriptencoding utf-8

if has('autocmd')
  function! s:NcAutocmds()
    augroup NcAutocmds
      autocmd!

      autocmd VimResized * execute "normal! \<c-w>="
      if exists('##TextYankPost')
        autocmd TextYankPost * silent! lua return require'vim.highlight'.on_yank{'Substitute', 150, true}
      endif
    augroup END
  endfunction

  call s:NcAutocmds()
endif
"
