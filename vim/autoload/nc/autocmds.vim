let g:NcColorColumnBufferNameBlacklist = []
let g:NcColorColumnFileTypeBlacklist = ['fzf', 'nerdtree', 'diff', 'fugitiveblame', 'undotree', 'qf']
let g:NcCursorlineBlacklist = ['fzf']
let g:NcMkviewFileTypeBlacklist = ['diff', 'gitcommit']

function! nc#autocmds#should_colorcolumn() abort
  if index(g:NcColorColumnBufferNameBlacklist, bufname(bufnr('%'))) != -1
    return 0
  endif
  if index(g:NcColorColumnFileTypeBlacklist, &filetype) != -1
    return 0
  endif
  return &buflisted
endfunction

function! nc#autocmds#should_cursorline() abort
  return index(g:NcCursorlineBlacklist, &filetype) == -1
endfunction

function! nc#autocmds#should_winhighlight() abort
  return &filetype!='nerdtree'
endfunction	

function! s:get_spell_settings() abort
  return {
        \'spell': &l:spell,
        \'spellcapcheck': &l:spellcapcheck,
        \'spellfile': &l:spellfile, 
        \'spelllang': &l:spelllang 
        \}
endfunction

function! s:set_spell_settings(settings) abort
  let &l:spell=a:settings.spell
  let &l:spellcapcheck=a:settings.spellcapcheck
  let &l:spellfile=a:settings.spellfile
  let &l:spelllang=a:settings.spelllang
endfunction

function! nc#autocmds#blur_window() abort
  if nc#autocmds#should_colorcolumn()
    let l:settings=s:get_spell_settings()
    ownsyntax off
    set nolist
    if has('conceal')
      set conceallevel=0
    endif
    call s:set_spell_settings(l:settings)
  endif
endfunction

function! nc#autocmds#focus_window() abort
  if nc#autocmds#should_colorcolumn()
    if !empty(&ft)
      let l:settings=s:get_spell_settings()
      ownsyntax
      set list
      if has('conceal')
        set conceallevel=1
      endif
      call s:set_spell_settings(l:settings)
    endif
  endif
endfunction

function! nc#autocmds#blur_statusline() abort
  let l:blurred='%{nc#statusline#gutterpadding()}'
  let l:blurred.='\ '
  let l:blurred.='\ '
  let l:blurred.='\ '
  let l:blurred.='\ '
  let l:blurred.='%<'
  let l:blurred.='%f'
  let l:blurred.='%='
  call s:update_statusline(l:blurred, 'blur')
endfunction

function! nc#autocmds#focus_statusline() abort
  call s:update_statusline('', 'focus')
endfunction

function! s:update_statusline(default, action) abort
  let l:statusline = s:get_custom_statusline(a:action)
  if type(l:statusline) == type('')
    execute 'setlocal statusline=' . l:statusline
  elseif l:statusline == 0
    return
  else
    execute 'setlocal statusline=' . a:default
  endif
endfunction

function! s:get_custom_statusline(action) abort
  if &ft ==# 'diff' && exists('t:diffpanel') && t:diffpanel.bufname ==# bufname('%')
    return 'Undotree\ preview'
  elseif &ft ==# 'undotree' || &ft ==# 'nerdtree'
    return 0
  elseif &ft ==# 'qf'
    if a:action ==# 'blur'
      return
            \ 	'%{nc#statusline#gutterpadding()}'
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '\ '
            \ . '%<'
            \ . '%q'
            \ . '\ '
            \ . '%{get(w:,\"quickfix_title\",\"\")}'
            \ . '%='
    else
      return g:NcQuickfixStatusline
    endif
  endif
  return 1 " Use default
endfunction

function! nc#autocmds#format(motion) abort
  if has('ex_extra')
    let l:v=operator#user#visual_command_from_wise_name(a:name)
    silent execute 'normal!' '`[' . l:v . '`]gq'
    '[,']retab!
  endif
endfunction
