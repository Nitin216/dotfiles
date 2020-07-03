function! s:SetupLoupeHighlight()
	echom 'Setup Loupe'
	if !nc#pinnacle#active()
		return 
	endif

	execute 'highlight! QuickFixLine ' . pinnacle#extract_highlight('PmenuSel')

	highlight! clear Search
	execute 'highlight! Search ' . pinnacle#embolden('Underlined')
endfunction

if has('autocmd')
	augroup NcLoupe
		autocmd!
		autocmd ColorScheme * call s:SetupLoupeHighlight()
	augroup END
endif
