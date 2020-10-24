scriptencodin utf-8

function! nc#statusline#fileprefix() abort
  let l:basename=expand('%:h')
  if l:basename ==# '' || l:basename ==# '.'
    return ''
  elseif has('modify_fname')
    " Make sure we show $HOME as ~.
    return substitute(fnamemodify(l:basename, ':~:.'), '/$', '', '') . '/'
  else
    return substitute(l:basename . '/', '\C^'. $HOME, '~', '')
  endif
endfunction

function! nc#statusline#ft() abort
  if strlen(&ft)
    return ',' . &ft
  else
    return ''
  endif
endfunction

function! nc#statusline#fenc() abort
  if strlen(&fenc) && &fenc !=# 'utf-8'
    return ',' . &fenc 
  else
    return ''
  endif
endfunction

function! nc#statusline#rhs() abort
  let l:rhs=' '
  if winwidth(0) > 80
    let l:column=virtcol('.')
    let l:width=virtcol('$')
    let l:line=line('.')
    let l:height=line('$')

    " Add padding to stop rhs from changing too much as we move the cursor
    let l:padding=len(l:height) - len(l:line)
    if (l:padding)
      let l:rhs.=repeat(' ', l:padding)
    endif

    let l:rhs.='ℓ ' 	
    let l:rhs.=l:line
    let l:rhs.=l:height
    let l:rhs.=' c ' 
    let l:rhs.=l:column
    let l:rhs.='/'
    let l:rhs.=l:width
    let l:rhs.=' '

    " Add padding to stop rhs from changing too much as we move the cursor
    if len(l:column) < 2
      let l:rhs.=' '
    endif
    if len(l:width) < 2
      let l:rhs.=' '
    endif
  endif
  return l:rhs
endfunction

let s:default_lhs_color='Identifier'
let s:async_lhs_color='Constant'
let s:modified_lhs_color='ModeMsg'
let s:nc_statusline_status_highlight=s:default_lhs_color
let s:async = 0

function! nc#statusline#async_start() abort
  let s:async=1
  call nc#statusline#check_modified()
endfunction

function! nc#statusline#async_finish() abort
  let s:async=2
  call nc#statusline#check_modified()
endfunction

function! nc#statusline#check_modified() abort
  if &modified && s:nc_statusline_status_highlight != s:modified_lhs_color
    let s:nc_statusline_status_highlight=s:modified_lhs_color
    call nc#statusline#update_highlight()
  elseif !&modified

    if s:async && s:nc_statusline_status_highlight != s:async_lhs_color
      let s:nc_statusline_status_highlight=s:async_lhs_color
      call nc#statusline#update_highlight()
    elseif !s:async && s:nc_statusline_status_highlight != s:default_lhs_color
      let s:nc_statusline_status_highlight=s:default_lhs_color
      call nc#statusline#update_highlight()
    endif
  endif
endfunction

function! nc#statusline#update_highlight() abort
  if !nc#pinnacle#active()
    return
  endif

  " Update StatusLine to use italics (used for filetype)
  let l:highlight=pinnacle#italicize('StatusLine')
  execute 'highlight User1 ' . l:highlight

  " Update MatchParen to use italics (used fo blurred statusline)
  let l:highlight=pinnacle#italicize('MatchParen')
  execute 'highlight User2 ' . l:highlight

  " StatusLine + bold (used for filenames).
  let l:highlight=pinnacle#embolden('StatusLine')
  execute 'highlight User3 ' . l:highlight

  let l:fg=pinnacle#extract_fg(s:nc_statusline_status_highlight)
  let l:bg=pinnacle#extract_bg('StatusLine')
  execute 'highlight User4 ' . pinnacle#highlight({'bg': l:bg, 'fg': l:fg})

  " And opposite for the buffer number area
  execute 'highlight User7 ' .
        \ pinnacle#highlight({
        \ 		'bg': l:fg,
        \ 		'fg': pinnacle#extract_fg('Normal'),
        \ 		'term': 'bold'
        \ })

  " Right-hand side section
  let l:bg=pinnacle#extract_fg("Cursor")
  let l:fg=pinnacle#extract_fg("User3")
  execute 'highlight User5 ' .
        \ pinnacle#highlight({
        \ 		'bg': l:fg,
        \ 		'fg': l:bg,
        \ 		'term': 'bold'
        \ })

  " Right-hand side section + italitcs (used for %)
  execute 'highlight User6 ' .
        \ pinnacle#highlight({
        \ 		'bg': l:fg,
        \ 		'fg': l:bg,
        \ 		'term': 'bold,italic'
        \ })

  highlight clear StatusLineNC
  highlight! link StatusLineNC User1
endfunction
