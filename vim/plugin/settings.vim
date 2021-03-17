"scriptencoding utf-8

"set autoindent
"set backspace=indent,start,eol
"set showtabline=1  " Dont show tabline
"set guicursor=
"set clipboard=unnamedplus " Using global clipboard"
"set inccommand=split  "Shows partial off-screen results in a preview window for %s.

"if exists('$SUDO_USER')
"  set nobackup
"  set nowritebackup
"else
"  set backupdir=~/.vim/tmp/backup
"  set backupdir+=.
"endif

"if exists('&belloff')
"  set belloff=all
"endif

"set cursorline
"set diffopt+=foldcolumn:0

"if exists('$SUDO_USER')
"  set noswapfile
"else
"  set directory=~/.vim/tmp/swap//
"  set directory+=.
"endif

"set expandtab

"if has('folding')
"  if has('window')
"    set fillchars=diff:∙        "BULLET OPERATOR
"    set fillchars+=fold:·       "MIDDLE DOT
"    set fillchars+=vert:┃       "BOX DRAWING HEAVY VERTICAL
"  endif

"  if has('nvim-0.3.1')
"    set fillchars+=eob:\
"  endif

"  set foldmethod=indent
"  set foldlevelstart=99

"endif

"set formatoptions+=n
"set formatoptions-=ro
"set guioptions-=T
"set hidden

if !has('nvim')
  " sync with corresponding nvim :highlight commands in ~/.vim/plugin/autocmds.vim:
  set highlight+=@:conceal            " ~/@ at end of window, 'showbreak'
  set highlight+=d:conceal            " override diffdelete
  set highlight+=n:foldcolumn         " make current line number stand out a little
  set highlight+=c:linenr             " blend vertical separators with line numbers
endif

"set laststatus=2
"set lazyredraw


"set list
set list                              " show whitespace
set listchars=eol:↲                  " EOL shown
set listchars+=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
" + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK iU+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
" set modelines=5                       " scan this many lines looking for modeline
"set nojoinspaces                      " dont autoinsert two spaces after '.', '?', '!' for join command
"set number                            " show line numbers in gutter'

"if exists('+relativenumber')
"  set relativenumber
"endif

"set scrolloff=3
"set shiftwidth=2                      " spaces per tab (when shifting)

"set shortmess+=A                      " ignore annoying swapfile messages
"set shortmess+=I                      " no splash screen
"set shortmess+=O                      " file-read message overwrites previous
"set shortmess+=T                      " truncate non-file messages in middle
"set shortmess+=W                      " don't echo "[w]"/"[written]" when writing
"set shortmess+=a                      " use abbreviations in messages eg. `[RO]` instead of `[readonly]`
"set shortmess+=c
"if has('patch-7.4.314')
"  set shortmess+=c                    " completion messages
"endif
""set shortmess+=o                      " overwrite file-written messages
""set shortmess+=t                      " truncate file messages at start

"" if has('linebreak')
""   set linebreak
""   let &showbreak='↳ '
"" endif

"if has('showcmd')
"  set noshowcmd
"endif

"if has('tabstop')
"  set tabstop=4
"endif

"set sidescroll=0
"set sidescrolloff=3
"set smarttab

"if has('winblend')
"  set winblend=10
"endif

"if has('pumblend')
"  set pumblend=15
"endif

"if has('windows')
"  set splitbelow
"endif

"if has('vertsplit')
"  set splitright
"endif

"if has('&swapsync')
"  set swapsync=
"endif
"set switchbuf=usetab

if has('syntax')
  set synmaxcol=200
endif

if has('mouse')
  set mouse=n
endif


if has('termguicolors')
  set termguicolors
endif

"set textwidth=150

"set updatecount=80                    "update swap file every 80 typed chars"
"set updatetime=100                   "CursorHold interval

"if has('viminfo') " i.e Vim
"  let s:viminfo='viminfo'
"elseif has('shada') " i.e Shada
"  let s:viminfo='shada'
"endif


"if exists('s:viminfo')
"  if exists('$SUDO_USER')
"    " Don't create root owned files
"    execute 'set ' . s:viminfo . '='
"    " Defaults:
"    "   Neovim: !,'100,<50,s10,h
"    "   Vim:    '100,<50,s10,h
"    "
"    " - ! save/restore global variables (only all-uppercase variables)
"    " - '100 save/restore marks from last 100 files
"    " - <50 save/restore 50 lines from each register
"    " - s10 max item size 10KB
"    " - h do not save/restore 'hlsearch' setting
"    "
"    " Our overrides:
"    " - '0 store marks for 0 files
"    " - <0 don't save registers
"    " - f0 don't store file marks
"    " - n: store in ~/.vim/tmp
"    "
"    execute 'set ' . s:viminfo . "='0,<0,f0,n~/.vim/tmp/" . s:viminfo

"    if !empty(glob('~/.vim/tmp/' . s:viminfo))
"      if !filereadable(expand('~/.vim/tmp' . s:viminfo))
"        echoerr 'warning: ~/.vim/tmp/' . s:viminfo . ' exists but is not readable'
"      endif
"    endif
"  endif
"endif


"set visualbell t_vb=                  " stop annoying beeping for non-error errors
"set whichwrap=b,h,l,s,<,>,[,],~       " allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
"set wildcharm=<C-z>                   " substitute for 'wildchar' (<Tab>) in macros
"if has('wildignore')
"  set wildignore+=*.o,*.rej           " patterns to ignore during file-navigation
"endif

"if has('wildmenu')
"  set wildmenu                        " show options as list when switching buffers etc
"endif

"set wildmode=longest:full,full        " shell-like autocomplete to unambiguous portion
