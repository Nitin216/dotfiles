if !has('nvim')
  finish
endif

function s:RemoveBg(group)
  if !nc#pinnacle#active()
    return
  endif

  let l:highlight=filter(luaeval("require'wincent.pinnacle'.dump(_A)", a:group),'v:key != "bg"')
  execute 'highlight! clear ' . a:group
  execute 'highlight! ' . a:group . ' ' . luaeval("require'wincent.pinnacle'.highlight(_A)", l:highlight)
endfunction

function s:CheckColorScheme()
  if !has('termguicolors')
    let g:base16colorspace=256
  endif

  let s:config_file = expand('~/.vim/.base16')

  if filereadable(s:config_file)
    let s:config = readfile(s:config_file, '', 2)

    if s:config[1] =~# '^dark\|light#'
      execute 'set background=' . s:config[1]
    else
      echoerr 'Bad background ' . s:config[1] . ' in ' . s:config_file
    endif

    if filereadable(expand('~/.vim/plugged/base16-vim/colors/base16-' . s:config[0] . '.vim'))
      execute 'colorscheme base16-' . s:config[0]
    else
      echoerr 'Bad scheme ' . s:config[0] . ' in '. s:config_file
    endif
  else
    set background=dark
    colorscheme base16-default-dark
  endif
  if nc#pinnacle#active()
    " execute 'highlight Comment ' . luaeval("require'wincent.pinnacle'.italicize('Comment')")
  endif
  highlight! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

  if &background ==# 'light'
    let s:conceal_term_fg=249
    let s:conceal_gui_fg='Grey70'
  else
    let s:conceal_term_fg=239
    let s:conceal_gui_fg='Grey30'
  endif

  highlight clear Conceal
  execute 'highlight Conceal ' .
        \ 'ctermfg=' . s:conceal_term_fg
        \ 'guifg=' . s:conceal_gui_fg

  "Sync with corresponding non-vim 'highlight' settings in 
  " ~/.vim/plugin/settings.vim
  highlight clear NonText
  highlight link NonText Conceal

  if nc#pinnacle#active() 
    highlight clear CursorLineNr
    execute 'highlight CursorLineNr ' . luaeval("require'wincent.pinnacle'.extract_highlight('DiffText')")

    highlight clear Pmenu
    highlight link Pmenu Visual
  endif

  highlight clear DiffDelete
  highlight link DiffDelete Conceal
  highlight clear VertSplit
  highlight link VertSplit LineNr

  "Resolve clashes with ColorColumn.
  "Instead of linking to Normal(which has a higher priority, link to
  "nothing).
  highlight link vimUserFunc None

  for l:group in ['DiffAdded', 'DiffFile', 'DiffNewFile', 'DiffLine', 'DiffRemoved']
    call s:RemoveBg(l:group)
  endfor

  " More subtle highlighting during merge conflict resolution
  highlight clear DiffAnd
  highlight clear DiffChange
  highlight clear DiffText

  if nc#pinnacle#active()
    let l:highlight=luaeval("require'wincent.pinnacle'.italicize('ModeMsg')")
    execute 'highlight User8 ' . l:highlight
  endif

  "Allow for overrides:
  " - `statusline.vim` will re-set User1, User2 etc.
  " - `after/plugin/loupe.vim` will override Search.
  doautocmd ColorScheme
endfunction

if v:progname !=# 'vi'
  if has('autocmd')
    augroup NcAutocolor
      autocmd!
      autocmd FocusGained * call s:CheckColorScheme()
    augroup END
  endif

  call s:CheckColorScheme()
endif
