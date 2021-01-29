if !has('nvim')
  finish
endif

lua require'nc.lsp'.init()

sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤

augroup NcLanguageClientAutocmds
  autocmd!
  autocmd ColorScheme * lua require'nc.lsp'.set_up_highlights()
" autocmd WinEnter * lua require'nc.lsp'.bind()
augroup END
