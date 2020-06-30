scriptencoding utf-8

if has('autocmd')
	"
	" Goyo
	"
	
	let s:matchad=v:null
	let s:settings={}

	function! s:goyo_enter()
		augroup NcAutocolor
			autocmd!
		augroup END
		augroup! NcAutocolor

		let s:settings = {
			\ 		'showbreak': &showbreak,
			\ 		'statusline': &statusline,
			\ 		'cursorline': &cursorline
			\ 		'showmode': &showmode
		}		
	
		set showbreak=
		set statusline=\
		set nocursorline
		set noshowmode

		if exists('$TMUX')
			silent !tmux set status off
		endif

		let l:nbsp=' '
		let s:matchadd=matchadd('Error', l:nbsp)

		let b:quitting=0
		let b:quitting_bang=0

		if exits('$TMUX')
			autocmd VimleavePre * call s:EnsureTmux()
		endif
	endfunction

	function! s:EnsureTmux()
		silent !tmux set status on
	endfunction

	function! s:goyo_leave()
		let l:is_last_buffer=len(filter(range(1,bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting && l:is_last_buffer
			if b:quitting_bang
				qa!
			else
				qa
			endif
		endif

		for [k,v] in items(s:settings)
			execute 'let &' . k . '=' . string(v)
		endfor

		if exists('$TMUX')
			silent !tmux set status on
		endif

		if type(s:matchadd) != type(v:null)
			try
				call matchdelete(s:matchadd)
			catch /./
			endtry
			let s:matchadd=v:null
		endif
	endfunction

	autocmd! User GoyoEnter nester call <SID>goyo_enter()
	autocmd! User GoyoLeave nester call <SID>goyo_leave()

endif
