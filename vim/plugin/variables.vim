scriptencoding utf-8

if has('nvim')
  " Variant of statusline from plugin/statusline.vim (can't comment inline
  " with line continuation markers without Vim freaking out).
  let g:NcQuickfixStatusline=
        \ '%7*'
        \ . '%{luaeval(\"' . "require'nc.statusline'.lhs()" . '\")}'
        \ . '%*'
        \ . '%4*'
        \ . ''
        \ . '\ '
        \ . '%*'
        \ . '%3*'
        \ . '%q'
        \ . '\ '
        \ . '%{get(w:,\"quickfix_title\",\"\")}'
        \ . '%*'
        \ . '%<'
        \ . '\ '
        \ . '%='
        \ . '\ '
        \ . ''
        \ . '%5*'
        \ . '%{luaeval(\"' . "require'nc.statusline'.rhs()" . '\")}'
        \ . '%*'
else
  let g:WincentQuickfixStatusline=''
endif

call nc#defer#defer('call nc#variables#init()')


