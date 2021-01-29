scriptencoding utf-8

if has('nvim')
  lua require'nc.statusline'.set()

  augroup NcStatusline
    autocmd!
    autocmd ColorScheme * lua require'nc.statusline'.update_highlight()
    autocmd User FerretAsyncStart lua require'nc.statusline'.async_start()
    autocmd User FerretAsyncFinish lua require'nc.statusline'.async_finish()
    autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * lua require'nc.statusline'.check_modified()
  augroup END
endif
