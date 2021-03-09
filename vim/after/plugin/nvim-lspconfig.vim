if !has('nvim')
  finish
endif

lua require'nc.lsp'.init()
lua require'nc.lsp'.setup_highlights()

sign define LspDiagnosticsSignError text=✖
sign define LspDiagnosticsSignWarning text=⚠
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤
