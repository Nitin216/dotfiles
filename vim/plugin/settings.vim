scriptencoding utf-8

set autoindent
set backspace=indent,start,eol

if exists('$SUDO_USER')
    set nobackup
    set nowritebackup
else
    set backupdir=~/.vim/tmp/backup
    set backupdir+=.
endif

if exists('&belloff')
    set belloff=all
endif

set cursorline
set diffopt+=foldcolumn:0

if exists('$SUDO_USER')
    set noswapfile
else
    set directory=~/.vim/tmp/swap//
    set directory+=.
endif

set expandtab

if has('folding')
    if has('window')
        set fillchars=diff:∙	"BULLET OPERATOR
        set fillchars+=fold:·	"MIDDLE DOT
        set fillchars+=vert:┃	"BOX DRAWING HEAVY VERTICAL
    endif

    if has('nvim-0.3.1')
        set fillchars+=eob:\
    endif

    set foldmethod=indent
    set foldlevelstart=99

endif


set hidden

if has('linebreak')
    set linebreak
    let &showbreak='↳ '
endif

if has('windows')
    set splitbelow
endif

if has('vertsplit')
    set splitright
endif

if has('syntax')
    set synmaxcol=200
endif

set tabstop=2

if has('termguicolors')
    set termguicolors
endif

set textwidth=80


