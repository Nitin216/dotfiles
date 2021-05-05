sign define LspDiagnosticsSignError text=✖ 
sign define LspDiagnosticsSignWarning text=⚠ 
sign define LspDiagnosticsSignInformation text=ℹ
sign define LspDiagnosticsSignHint text=➤ 

" function! s:Lsp_highlight()
"   hi LspDiagnosticsDefaultError guifg=#cc6666 guibg=NONE
"   hi LspDiagnosticsDefaultWarning guifg=#ebcb8b guibg=NONE

"   hi LspDiagnosticsSignError guifg=#cc6666 guibg=#343d46
"   hi LspDiagnosticsSignWarning guifg=#ebcb8b guibg=#343d46

"   hi LspDiagnosticsUnderlineError gui=underline 
"   hi LspDiagnosticsUnderlineWarning gui=underline
" endfunction 

" augroup NcLspHighlight
"   autocmd!
"   autocmd ColorScheme * call s:Lsp_highlight()
" augroup END
