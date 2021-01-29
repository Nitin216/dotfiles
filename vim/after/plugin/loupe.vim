" if !has('nvim')
"   finish
" end

" function! s:SetupLoupeHighlight()
"   execute 'highlight! QuickFixLine ' . luaeval("require'wincent.pinnacle'.extract_highlight('PmenuSel')")

"   highlight! clear Search
"   execute 'highlight! Search ' . luaeval("require'wincent.pinnacle'.embolden('Underlined')")
" endfunction

" augroup NcLoupe
"   autocmd!
"   autocmd ColorScheme * call s:SetupLoupeHighlight()
" augroup END
