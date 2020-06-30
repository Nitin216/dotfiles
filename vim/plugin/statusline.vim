scriptencoding utf-8

if has('statusline')
	set statusline=%7* 										" Switch to User7 highlight group
	set statusline+=%{nc#statusline#lhs()} 
	set statusline+=%* 										" Reset highlight group
	set statusline+=%4* 									" Switch to User4 highlight group
	set statusline+=    									" Powerline Arrow
	set statusline+=%* 										" Reset highlight group
	set statusline+=\ 										" Space
	set statusline+=%<										" Truncation point, if not enought width available
	set statusline+=%{nc#statusline#fileprefix()} 			" Relative path to file directory
	set statusline+=%3* 									" Switch to User3 highlight group (bold)
	set statusline+=%t 										" Filename
	set statusline+=%* 										" Reset highlight group
	set statusline+=\ 										" Space
	set statusline+=%1* 									" Switch to User1 highlight group (italics)

	" Need to have all on one line
	" %( 						Start item group.
	" [ 						Left bracket (literal)
	" %R 						Read-only flag: ,RO or nothing
	" %{nc#statusline#ft()} 	Filetype (not using %Y because don't want caps)
	" %{nc#statusline#fenc()} 	Filetype encoding if not UTF-8
	" ] 						Right bracket (literal)
	" %) 						End item group
	set statusline+=%([%R%{nc#statusline#ft()}%{nc#statusline#fenc()}]%)
	
	set statusline+=%* 										" Reset hightlight group
	set statusline+=%= 										" Split point for left and right group
	
	set statusline+=\ 										" Space
	set statusline+= 										"Powerline arrow
	set statusline+=%5* 									" Switch to User5 hightlight group
	set statusline+=%{nc#statusline#rhs()}
	set statusline+=%* 										" Reset hightlight group

	if has('autocmd')
		augroup NcStatusline
			autocmd!
			autocmd Colorscheme * call nc#statusline#update_highlight()
			autocmd User FerretAsyncStart call nc#statusline#async_start()
			autocmd User FerretAsyncFinish call nc#statusline#async_finish()
			if exists('##TextChangedI')
				autocmd BufWinEnter,BufWritePost,FileWritePost,TextChanged,TextChangedI,WinEnter * call nc#statusline#check_modified()
			else
				autocmd BufWinEnter,BufWritePost,FileWritePost,WinEnter * call nc#statusline#check_modified()
			endif
		augroup end
	endif
endif
