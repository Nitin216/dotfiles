"Setting basic stuff
set autoindent
set textwidth=80
set ts=4 sw=4
set backspace=indent,eol,start
set complete-=i
set smarttab
set number
set relativenumber
set noshowmode
set cursorline
set modeline
set encoding=utf8
filetype indent on
set foldmethod=indent               " not as cool as syntax, but faster
set foldlevelstart=99               " start unfolded
set guifont=Source\ Code\ Pro\ Light:h13
set wildmenu
set wildmode=full
set lazyredraw
set pyxversion=3

if !has('nvim')
  " Sync with corresponding nvim :highlight commands in ~/.vim/plugin/autocmds.vim:
  set highlight+=@:Conceal            " ~/@ at end of window, 'showbreak'
  set highlight+=D:Conceal            " override DiffDelete
  set highlight+=N:FoldColumn         " make current line number stand out a little
  set highlight+=c:LineNr             " blend vertical separators with line numbers
endif

" Plugins added
call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-surround'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'quramy/tsuquyomi'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'wikitopian/hardmode'
Plug 'palantir/tslint'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'keith/swift.vim'
Plug 'scrooloose/syntastic'
Plug 'udalov/kotlin-vim'
Plug 'jordwalke/vim-reasonml' 
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'editorconfig/editorconfig-vim'
Plug 'joshdick/onedark.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mileszs/ack.vim'
Plug 'wincent/pinnacle'
Plug 'wincent/ferret'
Plug 'wincent/loupe'
Plug 'chriskempson/base16-vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'

call plug#end()

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
"
" Hard mode enable on startup
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Setting leader key
let mapleader=" "

let g:vim_be_good_floating = 0
nnoremap <leader>pr ggdG:VimBeGood<CR>
" For using swiftlint and swift pm with syntatstic
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']


" Opening vimrc and splitting
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <silent><leader>sv :source $MYVIMRC<CR>
" Mapping jk to esc
inoremap <esc> <nop>
inoremap jk <esc> 
" Mapping jk to gj and gk"
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Mapping leader q to quit
nnoremap <leader>q :quit<CR>
" Keep search result in center of screen"
"nnoremap n nzz
"nnoremap N Nzz
"nnoremap * *zz
"nnoremap # #zz
"nnoremap g* g*zz
"nnoremap g# g#zz

" Mapping of buffer movement
nnoremap <silent><leader>l :bnext<CR>
nnoremap <silent><leader>h :bprevious<CR>

" Mapping of creating splits
nnoremap <silent><leader><bar> :vsplit<CR>
nnoremap <silent><leader>- :split<CR>

" Mapping of movement in buffers
nnoremap <silent><C-J> <C-W><C-J>
nnoremap <silent><C-K> <C-W><C-K>
nnoremap <silent><C-L> <C-W><C-L>
nnoremap <silent><C-H> <C-W><C-H>

command! BufOnly execute '%bdelete|edit #|normal `"'

" Mapping of tabs addition and movement
nnoremap <silent><C-T> :tabnew<CR>
nnoremap <silent><leader>t :tabnext<CR>
nnoremap <silent><leader>T :tabprev<CR>

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Mapping split width increase and decrease
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" NERDTree configs
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
"let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
nnoremap <C-n> :NERDTreeToggle<CR>
"nnoremap <silent><leader>n :NERDTreeFind<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FzF configs
let g:fzf_preview_window = ''
let g:fzf_preview_window = 'right:30%'
nnoremap <silent><leader>gf :GitFiles<CR>
nnoremap <silent><leader>ff :Files<CR>
nnoremap <silent><leader>h :Help<CR>

" Base16-shell integration
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Loupe config
"
let g:LoupeCenterResults=0

map <Nop><F1> <Plug>(LoupeN)
nmap <Nop><F2> <Plug>(Loupen)
