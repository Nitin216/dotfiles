if !has('nvim')
  finish
endif

lua require'nc.lsp'.init()

sign define LspDiagnosticsErrorSign text=✖
sign define LspDiagnosticsWarningSign text=⚠
sign define LspDiagnosticsInformationSign text=ℹ
sign define LspDiagnosticsHintSign text=➤

augroup NcLanguageClientAutocmds
  autocmd!
  autocmd ColorScheme * lua require'nc.lsp'.set_up_highlights()
  autocmd WinEnter * lua require'nc.lsp'.bind()
augroup END
