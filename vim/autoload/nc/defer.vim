function! nc#defer#defer(evalable) abort
	if has('autocmd') && has('vim_starting')
		execute 'autocmd User NcDefer ' . a:evalable
	else
		execute a:evalable
	endif
endfunction
