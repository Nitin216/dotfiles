"Setting basic stuff
set autoindent
set textwidth=80
set backspace=indent,eol,start
set complete-=i
set noshowmode
set cursorline
set modeline
set encoding=utf8
filetype indent on
set wildmenu
set pyxversion=3


" plugins added
call plug#begin()

Plug 'preservim/NERDTree'
Plug 'tpope/vim-surround'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'quramy/tsuquyomi'
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'palantir/tslint'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'keith/swift.vim'
Plug 'scrooloose/syntastic'
Plug 'udalov/kotlin-vim'
Plug 'jordwalke/vim-reasonml' 
Plug 'theprimeagen/vim-be-good', {'do': './install.sh'}
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
Plug 'yggdroot/indentline'

call plug#end()

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" setting leader key
let mapleader=" "

let g:vim_be_good_floating = 0
nnoremap <leader>pr ggdg:vimbegood<cr>

" for using swiftlint and swift pm with syntatstic
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

" mapping jk to esc
inoremap <esc> <nop>
inoremap jk <esc> 

command! BufOnly execute '%bdelete|edit #|normal `"'

" Mapping of tabs addition and movement
nnoremap <silent><C-T> :tabnew<CR>
nnoremap <silent><leader>t :tabnext<CR>
nnoremap <silent><leader>T :tabprev<CR>

" Mapping split width increase and decrease
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
" NERDTree configs
"let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
autocmd StdinReadPre * let s:std_in=1
nnoremap <silent><C-n> :NERDTreeToggle<CR>
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
